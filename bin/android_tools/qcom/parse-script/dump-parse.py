#!/usr/bin/python

import os

androidCodePath=''
runScriptPath=''
configFile=''

def main():
    getConfPath()

    if(os.path.exists(configFile) == False):
        print '''!!! Please configure your code path in "run.conf".'''
        exit()

    textList = testCodePath()
    if(textList == -1):
        exit()

    curPath = os.getcwd()
    if(os.path.exists('vmlinux')):
        vmlinuxPath=curPath
        ramdumpPath=curPath
    else:
        vmlinuxPath=curPath + os.sep + 'symbol'

        dirList = os.listdir(curPath)
        tmpList = []
        prefix = ' '
        k = 0
        for f in dirList:
            if(os.path.isfile(f) or (not cmp('symbol', f))):
                tmpList.append(f)
        for f in tmpList:
            dirList.remove(f)
        dirListLen = len(dirList)
        if(dirListLen > 1):
            for i in range(0,dirListLen):
                if( not cmp('symbol',dirList[i])):
                    k = k+1
                    continue;
                print(prefix*4 + '%d %s' % (i+1-k,dirList[i]))
            selNum = raw_input('whick directory to analysis:')
            selIndex = int(selNum)-1
            ramdumpPath = curPath + os.sep + dirList[selIndex]
        else:
            ramdumpPath = curPath + os.sep + dirList[dirListLen-1]

    print 'Start to analyze...'
    cmdLine = 'python' +\
             ' ' + runScriptPath + os.sep + 'ptools/linux-ramdump-parser-v2/ramparse.py' +\
             ' --vmlinux ' + vmlinuxPath + os.sep + 'vmlinux' +\
             ' --nm-path ' + androidCodePath + os.sep + 'prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-nm' +\
             ' --gdb-path ' + androidCodePath + os.sep + 'prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-gdb' +\
             ' -a ' + ramdumpPath +\
             ' --outdir ' + curPath + os.sep + 'out' +\
             ' -x --64-bit --force-hardware 8996'

    os.system(cmdLine)
def getConfPath():
    global configFile

    homePath = os.environ['HOME'] #os.path.expandvars('$HOME')
    configFile = homePath + os.sep + '.run.conf'
    if(os.path.exists(configFile) == False):
        fp = open(configFile, 'w')
        fp.write('androidCodePath=\nrunScriptPath=')
        fp.close()

def testCodePath():
    global androidCodePath
    global runScriptPath
    global configFile

    filep = open(configFile, 'r')
    tl = filep.readlines()
    filep.close()

    for i in range(0,len(tl)):
        tl[i] = tl[i].strip()
        try:
            idx = tl[i].index('=')
        except ValueError:
            print "Not found '=' in strings where search for!!!"
            return -1

        if(not tl[i][idx+1:]):
            print '''Not configure your code path. 
Please configure your code path in config file "~/.run.conf"!!!'''
            return -1

        if(not cmp('androidCodePath'.lower(), tl[i][0:idx].lower())):
            androidCodePath = tl[i][idx+1:]
        elif(not cmp('runScriptPath'.lower(), tl[i][0:idx].lower())):
            runScriptPath = tl[i][idx+1:]
        else:
            print 'Error! Please check your code path name!!!'
            return -1

    print "Code path is OK!"
    return tl

if __name__ == "__main__":
    main()
