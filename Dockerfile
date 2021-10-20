from quay.io/ansible/awx-ee:latest

COPY . .

ENV PLAYBOOK=site.yml
ENV INVENTORY=demo.yml

CMD  ansible-playbook $PLAYBOOK -i inventory/$INVENTORY
