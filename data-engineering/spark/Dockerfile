FROM spark:3.5.8

USER root

RUN pip install --no-cache-dir \
  spark-nlp==6.4.0 \
  numpy \
  pandas 

USER spark

ENTRYPOINT [ "/opt/entrypoint.sh" ]