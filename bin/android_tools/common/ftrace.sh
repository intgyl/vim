cd /sys/kernel/debug/tracing

echo 0 > tracing_on

echo 70000 > buffer_size_kb

echo "" > set_event

echo "" > trace

sync

echo power:cpu_idle power:cpu_frequency power:cpu_frequency_switch_start msm_low_power:* sched:sched_cpu_hotplug sched:sched_switch sched:sched_wakeup sched:sched_wakeup_new sched:sched_enq_deq_task >> set_event

echo power:clock_set_rate power:clock_enable power:clock_disable msm_bus:bus_update_request >> set_event

echo cpufreq_interactive:cpufreq_interactive_target cpufreq_interactive:cpufreq_interactive_setspeed >> set_event

echo irq:* >> set_event

echo mdss:mdp_mixer_update mdss:mdp_sspp_change mdss:mdp_commit >> set_event

echo workqueue:workqueue_execute_end workqueue:workqueue_execute_start workqueue:workqueue_activate_work workqueue:workqueue_queue_work >> set_event

echo kgsl:kgsl_pwrlevel kgsl:kgsl_buslevel kgsl:kgsl_pwr_set_state >> set_event

echo regulator:regulator_set_voltage_complete regulator:regulator_disable_complete regulator:regulator_enable_complete >> set_event

echo 0 > tracing_on && sleep 3 & echo "" > trace && echo 1 > tracing_on && sleep 20 && echo 0 > tracing_on && cat trace > /data/local/trace1.txt &
