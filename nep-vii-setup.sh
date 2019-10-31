# Start by symlinking to proton dlls
OIFS="$IFS"
IFS=$'\n'
for file in $(ls -1r . | grep Proton)
do
  (ln -s "../$file/dist/lib/wine/dxvk/*.dll" . && break) || echo "$file directory is empty. Trying another Proton install"
done
IFS="$OIFS"
# Then, move to the proton prefix
cd "../../compatdata/460120/pfx"
# Remove and replace with a 32-bit (Since megadimension won't work with 64-bit wine)
sudo rm -r *
WINEARCH=win32 WINEPREFIX=$PWD winetricks devenum quartz wmp10 csmt=on
cd drive_c/windows
# Add this directory since it's expected by proton
mkdir syswow64
echo "Setup successfully completed!"


