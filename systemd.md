systemd
---

**daemon reload**  
after changed  
```sh
systemctl daemon-reload
```

**start / stop / restart / reload**
```sh
systemctl start <unit ...>
systemctl stop <unit ...>
systemctl restart <unit ...>
systemctl reload <unit ...>
systemctl reload-or-restart <unit ...>
```

**enable / disable**
```sh
systemctl enable <unit ...>
systemctl disable <unit ...>
```

**view**
```sh
systemctl cat <unit>
```

**override some value**  
- drop-in file (partial with section header) `/etc/systemd/system/<unit>.service.d/override.conf`  
    * or `systemctl edit <unit>` - reload automatically on save (version 218+)  
- override file (whole file) `cp /lib/systemd/system/<unit>.service /etc/systemd/system`  
    * or `systemctl edit --full <unit>` - reload automatically on save (version 218+)  

service file
---
_! comments not allowed in the same line !_  

**[Unit] - depends and orders**  
`<unit>.service`  
```sh
[Unit]
Description=...
Requires=<unit2>.service   # depend - need
# Wants=<unit2>.service    # depend - optional
Before=<unit2>.service     # order - start before
After=<unit0>.service      # order - start after (succeeded or failed)
BindsTo=<unit>.service     # depend - stop if unit2.service stopped
```
**[Service] - environment and commands sequence**  
`<unit>.service`  
`ExecStart=...` on system startup  
`ExecStop=...` on system shutdown / reboot  
```
[Service]
...
Environment=<VAR=value>
ExecStartPre=<command1>
ExecStartPre=<command2>
ExecStart=<command>      # allow only 1 command except Type=oneshot
ExecStartPost=<command3>
ExecStartPost=<command4>
...
```
**[Install] - link to target directories**
```
[Install]
WantedBy=<target>
```
<hr>

**list all units**
```
systemctl list-unit-files
```

**list units by filter**  
```sh
systemctl | egrep <unit1|unit2>
```

**list by state** `enabled` / `disabled` / `indirect` / `static`  
```sh
systemctl list-unit-files | grep <state>
```

**Before shutdown**
```
[Unit]
Description=Before shutdown
DefaultDependencies=no  # not wait for anything
Requires=network.target # before network stop
Before=reboot.target poweroff.target halt.target

[Service]
Type=oneshot            # wait until this service finished
RemainAfterExit=true    # for no real ExecStart
ExecStart=/bin/true     # for no real ExecStart
ExecStop=<script>       # run on system shutdown / reboot

[Install]
WantedBy=multi-user.target # run at multi-user on system start
```
