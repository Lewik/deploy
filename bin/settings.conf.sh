#!/bin/bash

enable=1
ip_repo=2
gh_repo=3
localfolder=4
branch=5
site_server_name=5

erzakaz[ip_repo]="git.interprogma:erzakaz.git"
erzakaz[gh_repo]="git@github.com:Lewik/erzakaz.git"
erzakaz[localfolder]="../erzakaz/"
erzakaz[site_server_name]="erzakaz"

erreestr[ip_repo]="git.interprogma:erreestr.git"
erreestr[gh_repo]="git@github.com:Lewik/erreestr.git"
erreestr[localfolder]="../erreestr/"
erreestr[site_server_name]="erreestr"

ercommon[ip_repo]="git.interprogma:ercommon.git"
ercommon[gh_repo]="git@github.com:Lewik/ercommon.git"
ercommon[localfolder]="../ercommon/"
ercommon[site_server_name]="ercommon"

erportal[ip_repo]="git.interprogma:erportal.git"
erportal[gh_repo]="git@github.com:Lewik/erportal.git"
erportal[localfolder]="../erportal/"
erportal[site_server_name]="erportal"

eradmin[site_server_name]="eradmin"

ersf[ip_repo]="git.interprogma:ersf.git"
ersf[gh_repo]="git@github.com:Lewik/ersf.git"
ersf[localfolder]="../ersf/"
ersf[site_server_name]="ersf"

bundles_folder="ctcommon/"


scp_port=2222
scp_address="83.149.249.187"
scp_user="piter"
scp_pattern="/home/piter/Yamal_rel/*.zip"

log_dir="/var/log/"
scp_log=${log_dir}"scp_download.log"

base_user="er"
base_prod="er"
base_debug="er_debug"
pg_dump_path="pg_dump"

source local_settings.conf.sh
