# <span style="color: #566b70;">CRe_Notify</span>

Custom NUI Notification Script - Standalone Script - Official Script of the <a href="https://github.com/CRe-Framework" style="color: #80c4b7"><span>*CRe Framework*</span></a>

## **Install**

Download the resource and activate it in *server.cfg*
```lua
-- Enable the resource
ensure CRe_Notify
```
Make sure to initialize the resource before the other resources that use the script

## **Use**
See how to create the notification.  


<br><span style="background-color: #7089b8; padding: 4px; border-radius: 5px; color: #172236;">client-side</span>
```lua 
TriggerEvent('CRe_Notify:Show', '{type}', '{title}', '{message}', {milliseconds})
``` 
<br><span style="background-color: #eb9a65; padding: 4px; border-radius: 5px; color: #172236;">server-side</span>
```lua 
TriggerClientEvent('CRe_Notify:Show', source, '{type}', '{title}', '{message}', {milliseconds})
``` 

### <span style="letter-spacing: 2px;">Type: <span style="color: green"> success</span> / <span style="color: red;"> error </span> / <span style="color: yellow;"> warning </span> / <span style="color: cyan;"> info </span> / <span style=""> admin </span> / <span style="color: purple;"> party </span></span>

<br>

#
### Credits:  <a href="https://github.com/lucassbersee" style="color: #80c4b7; letter-spacing: 1.5px;"><span>*@lucassbersee*</span></a>