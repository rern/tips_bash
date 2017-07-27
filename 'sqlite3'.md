sqlite3 command line
---

**Example**
`Kodi`
- database `Addons27.db` 
- table `installed`  

**SQLite shell**   
`sqlite>` prompt  
`...>` multiline prompt  
`;` terminate multiline  
`.` leading dot for sqlite commands  
`.help` help  
`.exit` / `quit` / `Ctrl+D` exit shell  
`.databases` list databases  
`.open /path/file.db` open a database  
`.tables` list tables  

```sh
sqlite3
# SQLite version 3.16.0 2017-01-02 11:57:58
# Enter ".help" for usage hints.
# Connected to a transient in-memory database.
# Use ".open FILENAME" to reopen on a persistent database.
# sqlite>
```
<hr>

**BASH syntax**  
"\<query\>" must be quoted
```sh
sqlite3 <db file> "<query>"
```

**list tables**
```sh
sqlite3 /home/osmc/.kodi/userdata/Database/Addons27.db ".tables"
# addonlinkrepo  blacklist      installed      repo
# addons         broken         package        version
```

**show table structure**
```sh
sqlite3 /home/osmc/.kodi/userdata/Database/Addons27.db "PRAGMA table_info(installed)"
# 0|id|INTEGER|0||1
# 1|addonID|TEXT|0||0
# 2|enabled|BOOLEAN|0||0
# 3|installDate|TEXT|0||0
# 4|lastUpdated|TEXT|0||0
# 5|lastUsed|TEXT|0||0
# 6|origin|TEXT|1|''|0
```

**show all rows** `*`
```sh
sqlite3 /home/osmc/.kodi/userdata/Database/Addons27.db "SELECT * FROM installed"
# ...
# 159|script.module.simplejson|0|2017-07-06 13:51:55|||
# 160|script.module.unidecode|0|2017-07-06 13:51:55|||
# 161|script.skinshortcuts|0|2017-07-06 13:51:55|||
```

**get row** `addonID`  
(TEXT `value` must be quoted)  
```sh
sqlite3 /home/osmc/.kodi/userdata/Database/Addons27.db "SELECT * FROM installed WHERE addonID = 'script.skinshortcuts'"
# 161|script.skinshortcuts|0|2017-07-06 13:51:55|||
```

**update column** `enabled` in row `addonID`
```sh
sqlite3 /home/osmc/.kodi/userdata/Database/Addons27.db "UPDATE installed SET enabled = 1 WHERE addonID = 'script.skinshortcuts'"
#
# get row again will show 'enabled' updated:
# 161|script.skinshortcuts|1|2017-07-06 13:51:55|||
```
