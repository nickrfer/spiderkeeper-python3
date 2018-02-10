FROM python:3.6

RUN pip3 install spiderkeeper
RUN pip3 install scrapyd
RUN apt-get update
RUN mkdir /etc/scrapyd/ \
    && echo "[scrapyd]
            \n bind_address = 0.0.0.0
            \n jobs_to_keep = 5
            \n dbs_dir     = dbs
            \n max_proc    = 0
            \n max_proc_per_cpu = 4
            \n finished_to_keep = 100
            \n poll_interval = 5.0
            \n http_port   = 6800
            \n debug       = off
            " > /etc/scrapyd/scrapyd.conf

EXPOSE 5000 6800
