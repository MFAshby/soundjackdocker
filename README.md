# Dockerization of soundjack.eu

Soundjack.eu doesn't support more recent versions of ubuntu (due to some 
quite old dependencies). It's possible to run it in a docker container however,
with no loss of performance

Instructions:
1. Set following in /etc/docker/daemon.json
```json
{
	"cpu-rt-runtime": 950000
}
```
2. Download Soundjack for linux, extract it into a directory.
3. Clone this repository into the same directory
4. Run with `run.sh`

## Notes
* You might need to forward UDP port 50050 on your router to the machine running
soundjack
* The container is run with `--privileged`, I haven't found a great way to make it 
work without this. You should decide for yourself if this is ok.
