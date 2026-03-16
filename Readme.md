Second Assignment HY-548 - Kubernetes

1)

a)kubectl apply -f nginx-pod.yaml 
pod/nginx-assignment created αυτο μου εβγαλε μετα 
b)kubectl port-forward nginx-assignment 8080:80 και μετα πηγα στο λοκαλχοστ μου και το ειδα
c)kubectl logs nginx-assignment 
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/03/07 16:38:13 [notice] 1#1: using the "epoll" event method
2026/03/07 16:38:13 [notice] 1#1: nginx/1.29.5
2026/03/07 16:38:13 [notice] 1#1: built by gcc 15.2.0 (Alpine 15.2.0)
2026/03/07 16:38:13 [notice] 1#1: OS: Linux 6.6.87.2-microsoft-standard-WSL2
2026/03/07 16:38:13 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2026/03/07 16:38:13 [notice] 1#1: start worker processes
2026/03/07 16:38:13 [notice] 1#1: start worker process 30
2026/03/07 16:38:13 [notice] 1#1: start worker process 31
2026/03/07 16:38:13 [notice] 1#1: start worker process 32
2026/03/07 16:38:13 [notice] 1#1: start worker process 33
2026/03/07 16:38:13 [notice] 1#1: start worker process 34
2026/03/07 16:38:13 [notice] 1#1: start worker process 35
2026/03/07 16:38:13 [notice] 1#1: start worker process 36
2026/03/07 16:38:13 [notice] 1#1: start worker process 37
2026/03/07 16:38:13 [notice] 1#1: start worker process 38
2026/03/07 16:38:13 [notice] 1#1: start worker process 39
2026/03/07 16:38:13 [notice] 1#1: start worker process 40
2026/03/07 16:38:13 [notice] 1#1: start worker process 41
2026/03/07 16:38:13 [notice] 1#1: start worker process 42
2026/03/07 16:38:13 [notice] 1#1: start worker process 43
2026/03/07 16:38:13 [notice] 1#1: start worker process 44
2026/03/07 16:38:13 [notice] 1#1: start worker process 45
127.0.0.1 - - [07/Mar/2026:16:43:08 +0000] "GET / HTTP/1.1" 200 615 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36" "-"
2026/03/07 16:43:11 [error] 32#32: *1 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 127.0.0.1, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "localhost:8080", referrer: "http://localhost:8080/"
127.0.0.1 - - [07/Mar/2026:16:43:11 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://localhost:8080/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36" "-"

αυτα μου εβγαλε 
d) kubectl exec -it nginx-assignment -- sh και μπαινεις στο shell Με αυτη την εντολη και τρεχεις μετα αυτη την εντολη 
vi /usr/share/nginx/html/index.html 
για να μπεις στον editor vi  παμε στο nginx και το αλλαζουμε με το My nginx 
πατας i για να κανεις insert και οταν το γραψεις esc και μετα :wq για write και exit και μετα κανεις refresh το λοκαλχοστ και το βλεπει 

e)kubectl cp nginx-assignment:/usr/share/nginx/html/index.html ./index.html αυτη κατεβαζει το αρχειο τοπικα 
kubectl cp ./index.html nginx-assignment:/usr/share/nginx/html/index.html
με αυτη την εντολη το στελνεις πισω 
και τελος μπαινεις για να το δεις 
localhost:8080
f)kubectl delete pod nginx-assignment
και μετα εβγαλε αυτο 
pod "nginx-assignment" deleted from default namespace

οποτε σταματησε 

2)

a) 
ετρεξα αυτο kubectl apply -f job-assignment.yaml  
 
αυτα βγηκαν
configmap/downloader-script created
job.batch/csd-downloader created

και μετα αυτο για να δω τα jobs 
kubectl get jobs csd-downloader

(επρεπε να σβησω ολα τα pods γιατι μου παρουσιαζε σφαλμα με το προηγουμενο yaml)
b)
προσθεσα το PersistentVolumeClaim για μονιμη αποθηκευση,chronjob με σκεντζουλ 15 2 * * *

μετα το ετρεξα με την εντολη kubectl apply -f job-assignment.yaml
και επειδη ηθελα να το δοκιμσω τωρα αντι να περιμενω μεχρι τις 2 το βραδυ ετρεξα αυτο 
kubectl create job --from=cronjob/csd-refresh-cron manual-test
και για να δω οτι ολα καλα ετρεξα αυτο 
kubectl get jobs
και μου εβγαλε τα confirmn 1/1 οποτε ηταν ολα καλα 
c)αντικαταστησα το  pod με deployment και εβαλα και το init container για σιγουρη ληψη των δεδομενων πριν την εκκινηση του web server 
μετα εκανα kubectl apply -f 2cfinal.yaml  για να το τρεξω 
μετα  kubectl get pods για να δω οτι υπαρχει το csd-web-deploy-κατι... και να ειναι σε 0/1 στατους που σημαινει οτι το κοντεινερ ξεκινησε πρωτο και ο nginx περιμενει 
μετα που ετρεξα τα logs : kubectl logs -l app=csd-site -c initial-download
εβγαλαν αυτο 
Converted links in 9 files in 0.01 seconds. 
μετα την ολοκληρωση του ινιτ το pod περασε σε κατασταση running 
και τελος ειδα τα αρχεια στο nginx με την εντολη 
kubectl exec -it deployment/csd-web-deploy -- ls -lh /usr/share/nginx/html
και εκει ειδα το index ετσι :
-rw-r--r-- 1 root root 60K Mar 9 14:29 index.html
3)

a)φτιαχτηκε το dockerfile και το entrypoint.sh και το sh χρησιμοποιει τη μεταβλητη SITE_URL
αρχικα :docker login
build:docker build -t titoyannis/my-wget-nginx:v1 .
push:docker push titoyannis/my-wget-nginx:v1

b)φτιαχτηκε ενα yaml με replicas: 2 και service ClusterIP
τρεξιμο :kubectl apply -f final-ingress.yaml
επιβεβαίωση οτι τρεχουν και τα 2 pods: kubectl get pods -l app=csd-app
να δουμε το κατεβασμα της σελιδας: kubectl logs -l app=csd-app

c)εγκατασταση του ingress 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/cloud/deploy.yaml
και επεκταση του yaml για δευτερο deployment και service 
τρεξιμο yaml:kubectl apply -f final-ingress.yaml
ελεγχος οτι το ingress δουλευει με το λοκαλχοστ: kubectl get ingress univ-ingress
μπαινουμε και στα 
http://localhost/csd
http://localhost/math 
και τα βλεπουμε οτι μπαινουν κανονικα τα sites 
!Σημειωση: Χρειαστηκε να βαλω ingressClassName: nginx στο YAML για να βλεπει ο controller το ingress αλλιως εβγαζε 503. Επισης εκανα το build με --platform linux/amd64 γιατι χωρις αυτο το image δεν ετρεχε στα Pods εβγαζε Exec format error

