#!/bin/bash


echo "Executar esse script como super usuario!"

diretorios=(adm ven sec)
cd /
echo "Criando os diretorios ..."
mkdir publico adm ven sec

echo "Criando os grupos ..."
grupo=(GRP_ADM GRP_VEN GRP_SEC)

for i in ${grupo[*]}; 
do 
    groupadd $i; 
done

echo "Criando os usuarios ..."
usersADM=(carlos maria joao)
usersVEN=(debora sebastiana roberto)
usersSEC=(josefina amanda rogerio)

for i in ${usersADM[*]};
do
    useradd $i -s /bin/bash -p $(openssl passwd senha123) -G GRP_ADM ;
done

for i in ${usersVEN[*]};
do
    useradd $i -s /bin/bash -p $(openssl passwd senha123) -G GRP_VEN ;
done

for i in ${usersSEC[*]};
do
    useradd $i -s /bin/bash -p $(openssl passwd senha123) -G GRP_SEC ;
done

echo "Alterando permissões ..."
chown root:GRP_ADM adm
chown root:GRP_VEN ven
chown root:GRP_SEC sec

chmod 777 /publico
for i in ${diretorios[*]};
do
    chmod 770 $i ;
done