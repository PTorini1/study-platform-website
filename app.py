import functools
from flask import Flask,render_template, request, flash, send_from_directory
from flask_mysqldb import MySQL
from flask_socketio import SocketIO, emit
from werkzeug.utils import secure_filename
import os
import urllib.request
from pathlib import Path 

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.utils import secure_filename
import os
import urllib.request
#import wget

bp = Blueprint('auth', __name__, url_prefix='/auth')

app = Flask(__name__)
io = SocketIO(app)

#- criando a conexao com o banco -- VERSAO HEROKU
mysql = MySQL(app)
app.config['MYSQL_HOST'] = 'us-cdbr-east-06.cleardb.net'
app.config['MYSQL_USER'] = 'be833ebed6b2ed'
app.config['MYSQL_PASSWORD'] = 'b43c3668'
app.config['MYSQL_DB'] = 'heroku_3624ff9c487b5c5'

app.secret_key = "emanuel-gatao"
#- criando a conexao com o banco -- VERSAO SENAI LOCAL
# mysql = MySQL(app)
# app.config['MYSQL_HOST'] = 'localhost'
# app.config['MYSQL_USER'] = 'root'
# app.config['MYSQL_PASSWORD'] = ''
# app.config['MYSQL_DB'] = 'heroku_3624ff9c487b5c5'

io = SocketIO(app)
# lists data
dados_aluno = []
dados_prof = []
cad = []
usr = []

UPLOAD_FOLDER = 'static/uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER  
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'pdf', 'docx'])
  
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
# -- routes
@app.route('/')
def login():
    return render_template('login.html')

@app.route('/home')  
def home():
    usuario = get_user()
    return render_template('home.html', usuario = usuario)

@app.route('/cadastrar_aluno')
def cadastroAluno():
    return render_template('cadastroAluno.html')

@app.route('/cadastrar_professor')
def cadastroProfessor():
    return render_template('cadastroProfessor.html')

@app.route('/calendar')
def calendario():
    return render_template('calendar.html')

@app.route('/chat', methods = ['POST', 'GET'])
def chat():
    nomes = []
    nifs = []
    minhasMensagens = []
    mensagensOutros = []
    id_usuario = dados_prof[0][0]
    id_professor = dados_prof[0][0]
    
    if request.method == 'POST':
        try:
            mensagem = request.form['mensagem']
            cursor = mysql.connection.cursor()
            cursor.execute('INSERT INTO chat (id_usuario, id_recebedor, mensagem) VALUES(%s,%s,%s)',(id_usuario, id_professor,mensagem))
            mensagens = cursor.fetchall()
            print(mensagens)
        except:
            print(1)
            
    cursor = mysql.connection.cursor()
    cursor2 = mysql.connection.cursor()
    
    print(dados_prof)
    cursor.execute('SELECT NIF, Nome, url_foto FROM cadastro_professor')
    cursor2.execute('SELECT * FROM chat WHERE id_usuario OR id_recebedor=24')
    
    contatos = cursor.fetchall()
    y = len(contatos)
    mensagens = cursor2.fetchall()
    z = len(mensagens)
    
    for n in range(y):
        nifs.append(contatos[n][0])
        nomes.append(contatos[n][1])
        
    for n in range(z):
        if mensagens[n][1] == id_usuario:
            minhasMensagens.append(mensagens[n][3])
        elif mensagens[n][1] != id_usuario:
            mensagensOutros.append(mensagens[n][3])
        
    return render_template('chat.html', nome = nomes, contato = contatos, y=y, nif = nifs, mensagem = mensagens, minhaMensagem = minhasMensagens, outros = mensagensOutros,z=z)

@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

@app.route('/perfilAluno', methods = ['POST', 'GET'])
def perfilAluno():
    print(dados_aluno)
    email = dados_aluno[0][10]
    senha= dados_aluno[0][11]
    ra_ = dados_aluno[0][0]
    get_info_aluno(email=email, senha= senha)
    print(dados_aluno)
    if request.method == 'POST': 
        try: 
            nome = request.form['nome']
            cpf = request.form['cpf']
            rg = request.form['rg']
            dt_nasc = request.form['nascimento']
            sexo = request.form['sexo']
            end = request.form['endereco']
            tel = request.form['telefone']
            email = request.form['email']
            senha = request.form['senha']
            nm_pai =  request.form['nome_pai']
            nm_mae =  request.form['nome_mae']
            cursor= mysql.connection.cursor()  
            sql_update_qr =  """Update heroku_3624ff9c487b5c5.cadastro_aluno set Nome = %s, RG=%s, CPF=%s, Data_Nascimento=%s, Sexo=%s,Nome_pai=%s, Nome_mae=%s, Endereco=%s, Telefone=%s, email=%s, senha=%s where RA = %s""" 
            data_qr = (nome, rg, cpf, dt_nasc, sexo, nm_pai, nm_mae, end, tel, email, senha, ra_)
            cursor.execute(sql_update_qr, data_qr)
            mysql.connection.commit()
            cursor.close()
            return redirect('/')
        except Exception as e :
            print('erro: ', e) 

    return render_template('perfilAluno.html', ra_bd = dados_aluno[0][0], nome_bd = dados_aluno[0][1] ,  rg_bd = dados_aluno[0][2] ,cpf_bd = dados_aluno[0][3],  data_nas_bd = dados_aluno[0][4] ,sexo_bd = dados_aluno[0][5], np_bd = dados_aluno[0][6], nm_bd = dados_aluno[0][7],  end_bd = dados_aluno[0][8], tel_bd = dados_aluno[0][9],  email_bd = dados_aluno[0][10] ,senha_bd = dados_aluno[0][11]) 


@app.route('/perfilProfessor', methods = ['POST', 'GET'])
def perfilProfessor():
    if request.method == 'POST': 
        nif = dados_prof[0][0]
        email =  dados_prof[0][9]
        senha = dados_prof[0][10] 
        get_info_professor(email=email, senha= senha)
        print(dados_prof)
        try:    
            nome = request.form['nome']
            cpf = request.form['cpf']
            rg = request.form['rg']
            dt_nasc = request.form['nascimento']
            sexo = request.form['sexo']
            end = request.form['endereco']
            tel = request.form['telefone']
            email = request.form['email']
            senha = request.form['senha']
            formacao =  request.form['formacao']
            disc =  request.form['disc']
            cursor= mysql.connection.cursor()
            sql_update_qr =  """Update heroku_3624ff9c487b5c5.cadastro_professor set Nome = %s, RG=%s, CPF=%s, Data_Nascimento=%s, Sexo=%s, Endereco=%s, Telefone=%s, email=%s, senha=%s, Nome_Disciplina = %s, Formacao = %s where NIF = %s""" 
            data_qr = (nome, rg, cpf, dt_nasc, sexo, end, tel, email, senha,disc, formacao, nif)
            cursor.execute(sql_update_qr, data_qr)
            mysql.connection.commit()
            cursor.close()
            return redirect('/')
        except Exception as e :
            print('erro: ', e) 
    return render_template('perfilProfessor.html', nif = dados_prof[0][0],nome_bd = dados_prof[0][1], cpf_bd = dados_prof[0][4], rg_bd = dados_prof[0][3],sexo_bd = dados_prof[0][7], data_nas_bd = dados_prof[0][5], end_bd = dados_prof[0][6], tel_bd = dados_prof[0][8], form_bd = dados_prof[0][2], disc_bd = dados_prof[0][11],  email_bd = dados_prof[0][9], senha_bd = dados_prof[0][10] )


@app.route('/tarefas/<tarefa>')
def tarefas(tarefa):
    tarefa = tarefa
    filename = get_file(tarefa)
    data = f'..\\static\\uploads\\{filename[0][1]}'
    usuario = get_user()
    divs = get_data(curso = tarefa) # fazer um parametreo no get_data p receber o curso no select
    div_tarefa = get_data_tarefa(curso=tarefa)
    return render_template('tarefaAcervo.html', divs = divs, usuario = usuario, filename = filename)

def get_data_tarefa(curso):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * from tarefa_{}".format(curso))
    rows_tarefas = cursor.fetchall()    
    return rows_tarefas

def get_data(curso):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * from acervo_{}".format(curso))
    rows = cursor.fetchall()    
    return rows

def get_file(curso):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * from acervo_{} where disciplina ='{}'".format(curso, curso))
    rows = cursor.fetchall()    
    print(rows)
    return rows

def get_user():         
    if usr[0] == 'professor':
        usur = 'professor'
        return usur
    elif usr[0] == 'aluno':
        usur = 'aluno'  
        return usur

@app.route('/inserir-material')
def insert_screen():
    return render_template('send_files.html')

@app.route('/upload_acervo', methods = ['POST', 'GET'])
def upload_acervo():
    cur = mysql.connection.cursor()
    if request.method == 'POST':
        desc = request.form['descricao-material']
        disc =  request.form['disciplina']
        professor =  dados_prof[0][1] 
        files = request.files.getlist('files[]')

        for file in files:
            if file and allowed_file(file.filename):
                filename = secure_filename(file.filename)
                file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
                sz = (Path(f'static/uploads/{filename}').stat().st_size) # em bytes
                split_tup = os.path.splitext(f'static/uploads/{filename}')
                file_extension = split_tup[1]
                cur.execute("INSERT INTO acervo_{} (file_name, descricao, disciplina, professor, size, type) VALUES (%s, %s, %s, %s, %s, %s)".format(disc),['..\\static\\uploads\\'+filename, desc, disc, professor, sz, file_extension])
                mysql.connection.commit()
                print(sz, ' é o tamnanho do arquivo')
            print(file)
        cur.close()   
    return redirect('tarefas/{}'.format(disc))

def get_info_professor(email, senha):
    cursor= mysql.connection.cursor()
    cursor.execute("SELECT * from heroku_3624ff9c487b5c5.cadastro_professor WHERE email = '{}' AND senha = '{}'".format(email, senha))
    dados = cursor.fetchone()
    dados_prof.append(dados)
    usr.append('professor')
    print(dados_prof)
    return dados

def get_info_aluno(email, senha):
    cursor= mysql.connection.cursor()
    cursor.execute("SELECT * from heroku_3624ff9c487b5c5.cadastro_aluno WHERE email = '{}' AND senha = '{}'".format(email, senha))
    dados = cursor.fetchone()
    dados_aluno.append(dados)
    usr.append('aluno')
    return dados

@app.route('/upload_tarefa', methods = ['POST', 'GET'])
def upload_tarefa():
    cur = mysql.connection.cursor()
    if request.method == 'POST':
        desc = request.form['descricao-material-tarefa']
        disc =  request.form['disciplina-tarefa']
        title =  request.form['title-tarefa']
        professor =  dados_prof[0][1] 
        cur.execute("INSERT INTO tarefa_{} (title, descricao, disciplina, professor) VALUES (%s, %s, %s, %s)".format(disc),[title, disc, desc, professor])
        mysql.connection.commit()
        cur.close()   
    return redirect('tarefas/{}'.format(disc))

    
@app.route('/login', methods = ['POST', 'GET'])
def login_screen():
    if request.method == 'POST':
        email = request.form['email']
        senha = request.form['senha']
                
        if 'professor' in email:
            dados = get_info_professor(email=email, senha=senha)
            dados_prof.append(dados)
            usr.append('professor')

            try: 
                if dados[9]== email and dados[10] == senha:               
                    return redirect(url_for('home'))
            except Exception as e:
                flash(f'Credenciais não encontradas.')                              
                return render_template('login.html')

        elif 'aluno' in email:
            dados = get_info_aluno(email=email, senha=senha)
            dados_aluno.append(dados)
            usr.append('aluno')
            try: 
                if dados[10]== email and dados[11] == senha: 
                    return redirect(url_for('home'))  
            except Exception as e:
                flash(f'Credenciais não encontradas.')                              
                return render_template('login.html')     
        else:
            flash('Insira uma conta de aluno ou professor')
            return render_template('login.html')     
    return render_template('login.html')

@app.route('/insert', methods = ['POST'])
def insertAluno():
    if request.method == 'POST': 
        try: 
            nome = request.form['nome']
            cpf = request.form['cpf']
            rg = request.form['rg']
            dt_nasc = request.form['nascimento']
            sexo = request.form['sexo']
            end = request.form['endereco']
            tel = request.form['telefone']
            email = request.form['email']
            senha = request.form['senha']
            nm_pai =  request.form['nome_pai']
            nm_mae =  request.form['nome_mae']
            cursor2 = mysql.connection.cursor()
            cursor2.execute(
                "INSERT INTO heroku_3624ff9c487b5c5.cadastro_aluno (Nome, RG, CPF, Data_Nascimento, Sexo, Nome_pai, Nome_mae, Endereco, Telefone, email, senha) VALUES (%s, %s,%s, %s, %s, %s, %s, %s, %s, %s, %s)", 
                (nome,rg, cpf, dt_nasc, sexo, nm_pai, nm_mae, end, tel, email, senha))
            mysql.connection.commit()
            return render_template('login.html')
            
        except:
            print('deu erro')
            return render_template('cadastroAluno.html')

@app.route('/insertprof', methods=['POST'])
def insertProfessor():
    if request.method == 'POST': 
        try:
            nome = request.form['nome']
            cpf = request.form['cpf']
            rg = request.form['rg']
            dt_nasc = request.form['nascimento']
            sexo = request.form['sexo']
            end = request.form['endereco']
            formacao = request.form['formacao']
            disciplina = request.form['disc']
            tel = request.form['telefone']
            email = request.form['email']
            senha = request.form['senha']

            cursor = mysql.connection.cursor()
            cursor.execute(
                "INSERT INTO heroku_3624ff9c487b5c5.cadastro_professor (Nome, Formacao, Data_Nascimento,CPF, RG, Endereco, Sexo, Telefone, Email, Senha, Nome_Disciplina) VALUES (%s, %s,%s, %s, %s, %s, %s, %s, %s, %s, %s)", 
                (nome,formacao, dt_nasc,cpf, rg, end, sexo,tel, email, senha, disciplina)
            )
            mysql.connection.commit()
            return render_template('login.html')
            
        except Exception as e:
            flash(f'deu erro {e}')
            return render_template('cadastroProfessor.html')

@io.on('sendMessage')
def send_message_handler(msg):
    emit('getMessage', msg, broadcast=True)

if __name__ == '__main__':
    io.run(app, debug=True)