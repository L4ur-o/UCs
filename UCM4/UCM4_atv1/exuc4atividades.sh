#!/bin/bash

DB_NAME='uc4atividades'
DB_USER='user_funcionario'
DB_PASS='ShalltearBloodfallen123'
DB_PARAM='--single-transaction --routines --triggers'

MYSQLDUMP='/usr/bin/mysqldump' # Caminho para o comando mysqldump
BACKUP_DIR='/home/lauroo/Documentos/SENAC/MYSQL/UCM4/BACKUP' # Caminho para salvar os backups
DIAS=2 # Quantos dias de backups deseja manter

DATE=$(date +%Y-%m-%d)
BACKUP_NAME="mysql-$DATE.sql"
BACKUP_TAR="mysql-$DATE.tar"
BACKUP_BZ2="mysql-$DATE.tar.bz2"

echo "Iniciando o processo de backup..."

# Verificando permissões do diretório de backup
if [ ! -w "$BACKUP_DIR" ]; then
  echo "Permissão negada: O diretório $BACKUP_DIR não é gravável. Corrigindo permissões..."
  sudo chmod -R u+w "$BACKUP_DIR"
fi

# Gerando arquivo sql
echo "Gerando backup da base de dados $DB_NAME em $BACKUP_DIR/$BACKUP_NAME"
$MYSQLDUMP $DB_NAME $DB_PARAM -u $DB_USER -p$DB_PASS > $BACKUP_DIR/$BACKUP_NAME

if [ $? -ne 0 ]; then
  echo "Erro ao gerar o backup da base de dados. Verifique as permissões e as credenciais."
  exit 1
fi

# Compactando arquivo em tar
echo "Consolidando arquivo em tar ..."
tar -cf $BACKUP_DIR/$BACKUP_TAR -C $BACKUP_DIR $BACKUP_NAME

# Excluindo arquivos brutos
echo "  -- Excluindo arquivos desnecessarios ..."
rm -rf $BACKUP_DIR/$BACKUP_NAME

# Excluindo arquivos mais antigos
echo "Excluindo backups mais antigos que $DIAS dias ..."
find $BACKUP_DIR -name "*.tar" -type f -mtime +$DIAS -exec rm -f {} \;

echo "Backup concluido com sucesso."

