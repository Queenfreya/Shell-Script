#!/bin/bash

# Deletar usuário:
del(){
   # Exibir usuários existentes:
                clear
                        echo "Usuário(s) existente(s):"
                        echo "_____________________________"
                                egrep [1][0-9]{3} /etc/passwd | cut -d: -f1
                        echo "_____________________________"

        # Nome:         
      echo -en "\nDelete um usuário: "
         read user

# Deletendo usuário:
        dele(){
                if sudo userdel -r $user; then
                        clear
                                echo "[Ok] usuário [$user] foi deletado"
                                echo "-----"
                else
                        clear
                                echo "[Erro] ao deletar usuário [$user]"
                                echo "-----"
                fi
        }

   # Pergunta de segurança:
      confirmar(){
            echo -en "\nTem certeza que deseja deletar este usuário [$user] [s/n]: "
            read confirma
               case $confirma in
                  s| S) dele;;
                  n| N) del;;
                  *) echo -e " _______________\n|Opção incorreta|\n|_______________|"; sleep 2s; clear; opc;;
               esac
      }
      confirmar

}
del