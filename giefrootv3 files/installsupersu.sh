#!/system/bin/sh

echo "Installing SuperSU"
if [ ! -f /data/local/tmp/SuperSU.zip ]; then
	echo "Error installing SuperSU. File not found."
	exit 1
fi

mkdir /data/local/tmp/supersu_extracted
/data/local/tmp/busybox unzip -d /data/local/tmp/supersu_extracted /data/local/tmp/SuperSU.zip &> /dev/null
chmod 777 /data/local/tmp/supersu_extracted/META-INF/com/google/android/update-binary
ln -s /data/local/tmp/busybox /data/local/tmp/unzip
export PATH="$PATH:/data/local/tmp"
output=`/system/bin/sh /data/local/tmp/supersu_extracted/META-INF/com/google/android/update-binary 3 1 /data/local/tmp/SuperSU.zip`
#echo $output > /data/local/tmp/supersulog
#chmod 777 /data/local/tmp/supersulog

rm -r /data/local/tmp/supersu_extracted
rm /data/local/tmp/unzip