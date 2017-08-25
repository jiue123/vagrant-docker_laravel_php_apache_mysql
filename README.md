# Setup Environment

**Step 1:** Run Project
 -
 - Use syntax ``vagrant up``.
 - After project running we use ``vagrant ssh`` will SSH into a running Vagrant machine.
 
**Step 2:** Run Project
  -
  - ``cd /vagrant/`` move to directory ``vagrant``
  - Type ``docker-compose up --build`` builds, (re)creates, starts, and attaches to containers for a service.
  
**Step 3:** Test Services
  -
  - [ Laravel ] Use private ip ``192.168.33.19`` in Vagrantfile and port ``8008``
  - [ Database ] Use private ip ``192.168.33.19`` in Vagrantfile, port ``8007``, username: ``root``, password: ``123456``