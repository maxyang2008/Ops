## command module
ansible mryxtest -m command -a "date +"%T.%6N"" --extra-vars "ansible_user=root ansible_password=realpassword"
ansible mryxprod -m command -a "date +"%T.%6N"" --extra-vars "ansible_user=www ansible_password=realpassword"