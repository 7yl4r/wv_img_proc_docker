## usage
`cd` into this repo then ensure ./testdata is located or linked here then do:

```
sudo docker image build -t 7yl4r/wv_img_proc_docker:0.0.1 .
sudo docker container run -v /home/tylar/git-repos/testdata:/testdata 7yl4r/wv_img_proc_docker:0.0.1
```
