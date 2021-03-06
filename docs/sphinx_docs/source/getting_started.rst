Getting started
=================

The suggested way to run the end-to-end ALIGN flow uses a Docker container-based flow for which the user must have docker-compose installed. The ALIGN software is installed in a container image and Make is used to run the flow through the containers. The user may also use the Makefile to run the ALIGN flow through the native Linux build of all the components in the current environment (assuming that all software prerequisites have been installed).

Two environment variables must be set to run the Makefile in any environment. The first is the ALIGN_HOME variable, which should point the top directory of the ALIGN analog system.

.. code-block:: bash 

		export ALIGN_HOME=<top of ALIGN source area>

The second is a working directory ALIGN_WORK_DIR, which can either be the full path to a working directory or a docker volume name.  

.. code-block:: bash 

		% export ALIGN_WORK_DIR=<volumeName for docker flow / full work dir path for native flow>

		% docker volume create <volumeName>

Native Linux Environment Flow
-------------------------------

You can use `install.sh <https://github.com/ALIGN-analoglayout/ALIGN-public/blob/native_single_command_flow/install.sh>`_  to install the requirements and the native flow. Please go through `how to debug installation failures in our documentation <https://align-public.github.io/debug.html>`_ for detailed explanation and common errors during installation.

.. note:: 
    Requirements

* Python > 3.6
* gcc >= 4.2
* Ubuntu >=18.04 / RedHat >= RHEL 7

.. code-block:: bash 
    
    for bash : source install.sh
    for tcsh : source install_tcsh.sh

.. comment
	* `Boost <https://github.com/boostorg/boost.git>`_ >= 1.68.0
	* `Lpsolve <https://sourceforge.net/projects/lpsolve/files/lpsolve/5.5.2.5/lp_solve_5.5.2.5_source.tar.gz/download>`_ >= 5.5.2.5
	* `JSON <https://github.com/nlohmann/json.git>`_ =3.7.3
	* `Googletest <https://github.com/google/googletest>`_ =1.10

.. note:: 
    Installation

.. code-block:: bash 
    
	cd PlaceRouteHierFlow
	make
	cd $ALIGN_HOME
	python3 -m venv $VENV 
	source $VENV/bin/activate 
	pip install --upgrade pip
	pip install -e .

Docker flow
------------------------------

ALIGN also supports push button flow on docker.

.. note:: 
    Requirements

* Docker-ce > 17.12
* Docker compose > 3.6

