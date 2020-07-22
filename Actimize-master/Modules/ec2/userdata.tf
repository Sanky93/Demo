data "template_file" "userdata_win" {
  template = <<EOF
<script>
mkdir C:\setup-scripts
cd C:\setup-scripts
echo "" > _INIT_STARTED_
net user ${var.INSTANCE_USERNAME} /add /y
net user ${var.INSTANCE_USERNAME} ${var.INSTANCE_PASSWORD}
net localgroup administrators ${var.INSTANCE_USERNAME} /add
echo ${base64encode(file("./Actimize-master/Modules/ec2/install-script-npp.ps1"))} > tmp1.b64 && certutil -decode tmp1.b64 install-script-npp.ps1
echo ${base64encode(file("./Actimize-master/Modules/ec2/install-script-Java.ps1"))} > tmp1.b64 && certutil -decode tmp1.b64 install-script-Java.ps1
powershell.exe -file "C:\setup-scripts\install-script-Java.ps1"  
powershell.exe -file "C:\setup-scripts\install-script-npp.ps1")    
If "${var.customer}"=="nbs" (powershell.exe -file "C:\setup-scripts\install-script-npp.ps1")     
echo "" > _INIT_COMPLETE
</script>
<persist>false</persist>
EOF
}
