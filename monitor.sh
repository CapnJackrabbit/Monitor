#!/bin/sh

uso_cpu()
{
atividade_cpu=`top -b -n 1 | grep Cpu | awk '{print $8}' | cut -f 1 -d","`
uso_cpu="$((100 - $atividade_cpu))"
alerta_uso=90
echo "Uso da CPU: $uso_cpu%"

if [ $uso_cpu -gt $alerta_uso ]
    then
       echo "Foi detectado um uso de CPU acima de 90%. Favor verificar!" | mailx -r root@jackrabbit -s "Alerta de uso da CPU!" jackrabbitace@gmail.com
    else
        echo "CPU normal"
fi

}

uso_cpu