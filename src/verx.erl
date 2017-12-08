% Copyright (c) 2011-2017, Michael Santos <michael.santos@gmail.com>
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions
% are met:
%
% Redistributions of source code must retain the above copyright
% notice, this list of conditions and the following disclaimer.
%
% Redistributions in binary form must reproduce the above copyright
% notice, this list of conditions and the following disclaimer in the
% documentation and/or other materials provided with the distribution.
%
% Neither the name of the author nor the names of its contributors
% may be used to endorse or promote products derived from this software
% without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
% "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
% LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
% FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
% COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
% INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
% BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
% LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
% ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.

-module(verx).

-include("verx.hrl").

% Static functions

-export([connect_open/1, open/1, open/2, close/1,
	 lookup/2]).

% Generated functions

-export([connect_open/2, connect_close/1,
	 connect_get_type/1, connect_get_version/1,
	 connect_get_max_vcpus/2, node_get_info/1,
	 connect_get_capabilities/1, domain_attach_device/2,
	 domain_create/2, domain_create_xml/2,
	 domain_define_xml/2, domain_destroy/2,
	 domain_detach_device/2, domain_get_xml_desc/2,
	 domain_get_autostart/2, domain_get_info/2,
	 domain_get_max_memory/2, domain_get_max_vcpus/2,
	 domain_get_os_type/2, domain_get_vcpus/2,
	 connect_list_defined_domains/2, domain_lookup_by_id/2,
	 domain_lookup_by_name/2, domain_lookup_by_uuid/2,
	 connect_num_of_defined_domains/1, domain_pin_vcpu/2,
	 domain_reboot/2, domain_resume/2,
	 domain_set_autostart/2, domain_set_max_memory/2,
	 domain_set_memory/2, domain_set_vcpus/2,
	 domain_shutdown/2, domain_suspend/2, domain_undefine/2,
	 connect_list_defined_networks/2, connect_list_domains/2,
	 connect_list_networks/2, network_create/2,
	 network_create_xml/2, network_define_xml/2,
	 network_destroy/2, network_get_xml_desc/2,
	 network_get_autostart/2, network_get_bridge_name/2,
	 network_lookup_by_name/2, network_lookup_by_uuid/2,
	 network_set_autostart/2, network_undefine/2,
	 connect_num_of_defined_networks/1,
	 connect_num_of_domains/1, connect_num_of_networks/1,
	 domain_core_dump/2, domain_restore/2, domain_save/2,
	 domain_get_scheduler_type/2,
	 domain_get_scheduler_parameters/2,
	 domain_set_scheduler_parameters/2,
	 connect_get_hostname/1, connect_supports_feature/2,
	 domain_migrate_prepare/2, domain_migrate_perform/2,
	 domain_migrate_finish/2, domain_block_stats/2,
	 domain_interface_stats/2, auth_list/1, auth_sasl_init/1,
	 auth_sasl_start/2, auth_sasl_step/2, auth_polkit/1,
	 connect_num_of_storage_pools/1,
	 connect_list_storage_pools/2,
	 connect_num_of_defined_storage_pools/1,
	 connect_list_defined_storage_pools/2,
	 connect_find_storage_pool_sources/2,
	 storage_pool_create_xml/2, storage_pool_define_xml/2,
	 storage_pool_create/2, storage_pool_build/2,
	 storage_pool_destroy/2, storage_pool_delete/2,
	 storage_pool_undefine/2, storage_pool_refresh/2,
	 storage_pool_lookup_by_name/2,
	 storage_pool_lookup_by_uuid/2,
	 storage_pool_lookup_by_volume/2,
	 storage_pool_get_info/2, storage_pool_get_xml_desc/2,
	 storage_pool_get_autostart/2,
	 storage_pool_set_autostart/2,
	 storage_pool_num_of_volumes/2,
	 storage_pool_list_volumes/2, storage_vol_create_xml/2,
	 storage_vol_delete/2, storage_vol_lookup_by_name/2,
	 storage_vol_lookup_by_key/2,
	 storage_vol_lookup_by_path/2, storage_vol_get_info/2,
	 storage_vol_get_xml_desc/2, storage_vol_get_path/2,
	 node_get_cells_free_memory/2, node_get_free_memory/1,
	 domain_block_peek/2, domain_memory_peek/2,
	 connect_domain_event_register/1,
	 connect_domain_event_deregister/1,
	 domain_event_lifecycle/1, domain_migrate_prepare2/2,
	 domain_migrate_finish2/2, connect_get_uri/1,
	 node_num_of_devices/2, node_list_devices/2,
	 node_device_lookup_by_name/2,
	 node_device_get_xml_desc/2, node_device_get_parent/2,
	 node_device_num_of_caps/2, node_device_list_caps/2,
	 node_device_dettach/2, node_device_re_attach/2,
	 node_device_reset/2, domain_get_security_label/2,
	 node_get_security_model/1, node_device_create_xml/2,
	 node_device_destroy/2, storage_vol_create_xml_from/2,
	 connect_num_of_interfaces/1, connect_list_interfaces/2,
	 interface_lookup_by_name/2,
	 interface_lookup_by_mac_string/2,
	 interface_get_xml_desc/2, interface_define_xml/2,
	 interface_undefine/2, interface_create/2,
	 interface_destroy/2, connect_domain_xml_from_native/2,
	 connect_domain_xml_to_native/2,
	 connect_num_of_defined_interfaces/1,
	 connect_list_defined_interfaces/2,
	 connect_num_of_secrets/1, connect_list_secrets/2,
	 secret_lookup_by_uuid/2, secret_define_xml/2,
	 secret_get_xml_desc/2, secret_set_value/2,
	 secret_get_value/2, secret_undefine/2,
	 secret_lookup_by_usage/2,
	 domain_migrate_prepare_tunnel/2, connect_is_secure/1,
	 domain_is_active/2, domain_is_persistent/2,
	 network_is_active/2, network_is_persistent/2,
	 storage_pool_is_active/2, storage_pool_is_persistent/2,
	 interface_is_active/2, connect_get_lib_version/1,
	 connect_compare_cpu/2, domain_memory_stats/2,
	 domain_attach_device_flags/2,
	 domain_detach_device_flags/2, connect_baseline_cpu/2,
	 domain_get_job_info/2, domain_abort_job/2,
	 storage_vol_wipe/2, domain_migrate_set_max_downtime/2,
	 connect_domain_event_register_any/2,
	 connect_domain_event_deregister_any/2,
	 domain_event_reboot/1, domain_event_rtc_change/1,
	 domain_event_watchdog/1, domain_event_io_error/1,
	 domain_event_graphics/1, domain_update_device_flags/2,
	 nwfilter_lookup_by_name/2, nwfilter_lookup_by_uuid/2,
	 nwfilter_get_xml_desc/2, connect_num_of_nwfilters/1,
	 connect_list_nwfilters/2, nwfilter_define_xml/2,
	 nwfilter_undefine/2, domain_managed_save/2,
	 domain_has_managed_save_image/2,
	 domain_managed_save_remove/2,
	 domain_snapshot_create_xml/2,
	 domain_snapshot_get_xml_desc/2, domain_snapshot_num/2,
	 domain_snapshot_list_names/2,
	 domain_snapshot_lookup_by_name/2,
	 domain_has_current_snapshot/2,
	 domain_snapshot_current/2, domain_revert_to_snapshot/2,
	 domain_snapshot_delete/2, domain_get_block_info/2,
	 domain_event_io_error_reason/1,
	 domain_create_with_flags/2,
	 domain_set_memory_parameters/2,
	 domain_get_memory_parameters/2,
	 domain_set_vcpus_flags/2, domain_get_vcpus_flags/2,
	 domain_open_console/2, domain_is_updated/2,
	 connect_get_sysinfo/2, domain_set_memory_flags/2,
	 domain_set_blkio_parameters/2,
	 domain_get_blkio_parameters/2,
	 domain_migrate_set_max_speed/2, storage_vol_upload/2,
	 storage_vol_download/2, domain_inject_nmi/2,
	 domain_screenshot/2, domain_get_state/2,
	 domain_migrate_begin3/2, domain_migrate_prepare3/2,
	 domain_migrate_prepare_tunnel3/2,
	 domain_migrate_perform3/2, domain_migrate_finish3/2,
	 domain_migrate_confirm3/2,
	 domain_set_scheduler_parameters_flags/2,
	 interface_change_begin/2, interface_change_commit/2,
	 interface_change_rollback/2,
	 domain_get_scheduler_parameters_flags/2,
	 domain_event_control_error/1, domain_pin_vcpu_flags/2,
	 domain_send_key/2, node_get_cpu_stats/2,
	 node_get_memory_stats/2, domain_get_control_info/2,
	 domain_get_vcpu_pin_info/2, domain_undefine_flags/2,
	 domain_save_flags/2, domain_restore_flags/2,
	 domain_destroy_flags/2,
	 domain_save_image_get_xml_desc/2,
	 domain_save_image_define_xml/2,
	 domain_block_job_abort/2, domain_get_block_job_info/2,
	 domain_block_job_set_speed/2, domain_block_pull/2,
	 domain_event_block_job/1,
	 domain_migrate_get_max_speed/2,
	 domain_block_stats_flags/2,
	 domain_snapshot_get_parent/2, domain_reset/2,
	 domain_snapshot_num_children/2,
	 domain_snapshot_list_children_names/2,
	 domain_event_disk_change/1, domain_open_graphics/2,
	 node_suspend_for_duration/2, domain_block_resize/2,
	 domain_set_block_io_tune/2, domain_get_block_io_tune/2,
	 domain_set_numa_parameters/2,
	 domain_get_numa_parameters/2,
	 domain_set_interface_parameters/2,
	 domain_get_interface_parameters/2,
	 domain_shutdown_flags/2, storage_vol_wipe_pattern/2,
	 storage_vol_resize/2, domain_pm_suspend_for_duration/2,
	 domain_get_cpu_stats/2, domain_get_disk_errors/2,
	 domain_set_metadata/2, domain_get_metadata/2,
	 domain_block_rebase/2, domain_pm_wakeup/2,
	 domain_event_tray_change/1, domain_event_pmwakeup/1,
	 domain_event_pmsuspend/1, domain_snapshot_is_current/2,
	 domain_snapshot_has_metadata/2,
	 connect_list_all_domains/2, domain_list_all_snapshots/2,
	 domain_snapshot_list_all_children/2,
	 domain_event_balloon_change/1, domain_get_hostname/2,
	 domain_get_security_label_list/2, domain_pin_emulator/2,
	 domain_get_emulator_pin_info/2,
	 connect_list_all_storage_pools/2,
	 storage_pool_list_all_volumes/2,
	 connect_list_all_networks/2,
	 connect_list_all_interfaces/2,
	 connect_list_all_node_devices/2,
	 connect_list_all_nwfilters/2,
	 connect_list_all_secrets/2,
	 node_set_memory_parameters/2,
	 node_get_memory_parameters/2, domain_block_commit/2,
	 network_update/2, domain_event_pmsuspend_disk/1,
	 node_get_cpu_map/2, domain_fstrim/2,
	 domain_send_process_signal/2, domain_open_channel/2,
	 node_device_lookup_scsi_host_by_wwn/2,
	 domain_get_job_stats/2,
	 domain_migrate_get_compression_cache/2,
	 domain_migrate_set_compression_cache/2,
	 node_device_detach_flags/2,
	 domain_migrate_begin3_params/2,
	 domain_migrate_prepare3_params/2,
	 domain_migrate_prepare_tunnel3_params/2,
	 domain_migrate_perform3_params/2,
	 domain_migrate_finish3_params/2,
	 domain_migrate_confirm3_params/2,
	 domain_set_memory_stats_period/2,
	 domain_create_xml_with_files/2,
	 domain_create_with_files/2,
	 domain_event_device_removed/1,
	 connect_get_cpu_model_names/2,
	 connect_network_event_register_any/2,
	 connect_network_event_deregister_any/2,
	 network_event_lifecycle/1,
	 connect_domain_event_callback_register_any/2,
	 connect_domain_event_callback_deregister_any/2,
	 domain_event_callback_lifecycle/1,
	 domain_event_callback_reboot/1,
	 domain_event_callback_rtc_change/1,
	 domain_event_callback_watchdog/1,
	 domain_event_callback_io_error/1,
	 domain_event_callback_graphics/1,
	 domain_event_callback_io_error_reason/1,
	 domain_event_callback_control_error/1,
	 domain_event_callback_block_job/1,
	 domain_event_callback_disk_change/1,
	 domain_event_callback_tray_change/1,
	 domain_event_callback_pmwakeup/1,
	 domain_event_callback_pmsuspend/1,
	 domain_event_callback_balloon_change/1,
	 domain_event_callback_pmsuspend_disk/1,
	 domain_event_callback_device_removed/1,
	 domain_core_dump_with_format/2, domain_fsfreeze/2,
	 domain_fsthaw/2, domain_get_time/2, domain_set_time/2,
	 domain_event_block_job_2/1, node_get_free_pages/2,
	 network_get_dhcp_leases/2,
	 connect_get_domain_capabilities/2,
	 domain_open_graphics_fd/2,
	 connect_get_all_domain_stats/2, domain_block_copy/2,
	 domain_event_callback_tunable/1, node_alloc_pages/2,
	 domain_event_callback_agent_lifecycle/1,
	 domain_get_fsinfo/2, domain_define_xml_flags/2,
	 domain_get_iothread_info/2, domain_pin_iothread/2,
	 domain_interface_addresses/2,
	 domain_event_callback_device_added/1,
	 domain_add_iothread/2, domain_del_iothread/2,
	 domain_set_user_password/2, domain_rename/2]).


% Send a remote protocol open message
%     <<>> : name
%     0 : flags
% See: remote_protocol_xdr:enc_remote_connect_open_args/1
connect_open(Ref) ->
    connect_open(Ref, [<<>>, 0]).

% For backwards compatibility, use connect_open/1,2.
open(Ref) ->
    connect_open(Ref, [<<>>, 0]).

open(Ref, Arg) ->
    connect_open(Ref, Arg).

close(Ref) ->
    connect_close(Ref).

lookup(Ref, {domain, Name}) ->
    Fun = [ fun() -> verx:domain_lookup_by_id(Ref, [maybe_integer(Name)]) end,
            fun() -> verx:domain_lookup_by_name(Ref, [maybe_binary(Name)]) end,
            fun() -> verx:domain_lookup_by_uuid(Ref, [uuid:string_to_uuid(Name)]) end,
            fun() -> verx:domain_lookup_by_uuid(Ref, [maybe_binary(Name)]) end ],
    lookup_1(Fun).

lookup_1(Fun)  ->
    lookup_1(Fun, []).
lookup_1([], [{error, Error}|_]) ->
    {error, Error};
lookup_1([Fun|Tail], Acc) ->
    try Fun() of
        {ok, Res} ->
            {ok, Res};
        {error, Error} ->
            lookup_1(Tail, [{error, Error}|Acc])
        catch
            _:_ ->
                lookup_1(Tail, Acc)
    end.

maybe_integer(N) when is_integer(N) -> N;
maybe_integer(N) when is_list(N) -> list_to_integer(N).

maybe_binary(N) when is_binary(N) -> N;
maybe_binary(N) when is_list(N) -> list_to_binary(N).


connect_open(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_CONNECT_OPEN', Arg).

connect_close(Ref) ->
    verx_client:call(Ref, 'REMOTE_PROC_CONNECT_CLOSE').

connect_get_type(Ref) ->
    verx_client:call(Ref, 'REMOTE_PROC_CONNECT_GET_TYPE').

connect_get_version(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_GET_VERSION').

connect_get_max_vcpus(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_GET_MAX_VCPUS', Arg).

node_get_info(Ref) ->
    verx_client:call(Ref, 'REMOTE_PROC_NODE_GET_INFO').

connect_get_capabilities(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_GET_CAPABILITIES').

domain_attach_device(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_ATTACH_DEVICE', Arg).

domain_create(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_CREATE', Arg).

domain_create_xml(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_CREATE_XML',
		     Arg).

domain_define_xml(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_DEFINE_XML',
		     Arg).

domain_destroy(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_DESTROY',
		     Arg).

domain_detach_device(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_DETACH_DEVICE', Arg).

domain_get_xml_desc(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_GET_XML_DESC',
		     Arg).

domain_get_autostart(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_AUTOSTART', Arg).

domain_get_info(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_GET_INFO',
		     Arg).

domain_get_max_memory(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_MAX_MEMORY', Arg).

domain_get_max_vcpus(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_MAX_VCPUS', Arg).

domain_get_os_type(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_GET_OS_TYPE',
		     Arg).

domain_get_vcpus(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_GET_VCPUS',
		     Arg).

connect_list_defined_domains(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_DEFINED_DOMAINS', Arg).

domain_lookup_by_id(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_LOOKUP_BY_ID',
		     Arg).

domain_lookup_by_name(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_LOOKUP_BY_NAME', Arg).

domain_lookup_by_uuid(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_LOOKUP_BY_UUID', Arg).

connect_num_of_defined_domains(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NUM_OF_DEFINED_DOMAINS').

domain_pin_vcpu(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_PIN_VCPU',
		     Arg).

domain_reboot(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_REBOOT', Arg).

domain_resume(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_RESUME', Arg).

domain_set_autostart(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_AUTOSTART', Arg).

domain_set_max_memory(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_MAX_MEMORY', Arg).

domain_set_memory(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_SET_MEMORY',
		     Arg).

domain_set_vcpus(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_SET_VCPUS',
		     Arg).

domain_shutdown(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_SHUTDOWN',
		     Arg).

domain_suspend(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_SUSPEND',
		     Arg).

domain_undefine(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_UNDEFINE',
		     Arg).

connect_list_defined_networks(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_DEFINED_NETWORKS', Arg).

connect_list_domains(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_DOMAINS', Arg).

connect_list_networks(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_NETWORKS', Arg).

network_create(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NETWORK_CREATE',
		     Arg).

network_create_xml(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NETWORK_CREATE_XML',
		     Arg).

network_define_xml(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NETWORK_DEFINE_XML',
		     Arg).

network_destroy(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NETWORK_DESTROY',
		     Arg).

network_get_xml_desc(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NETWORK_GET_XML_DESC', Arg).

network_get_autostart(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NETWORK_GET_AUTOSTART', Arg).

network_get_bridge_name(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NETWORK_GET_BRIDGE_NAME', Arg).

network_lookup_by_name(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NETWORK_LOOKUP_BY_NAME', Arg).

network_lookup_by_uuid(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NETWORK_LOOKUP_BY_UUID', Arg).

network_set_autostart(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NETWORK_SET_AUTOSTART', Arg).

network_undefine(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NETWORK_UNDEFINE',
		     Arg).

connect_num_of_defined_networks(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NUM_OF_DEFINED_NETWORKS').

connect_num_of_domains(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NUM_OF_DOMAINS').

connect_num_of_networks(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NUM_OF_NETWORKS').

domain_core_dump(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_CORE_DUMP',
		     Arg).

domain_restore(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_RESTORE',
		     Arg).

domain_save(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_SAVE', Arg).

domain_get_scheduler_type(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_SCHEDULER_TYPE', Arg).

domain_get_scheduler_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_SCHEDULER_PARAMETERS', Arg).

domain_set_scheduler_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_SCHEDULER_PARAMETERS', Arg).

connect_get_hostname(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_GET_HOSTNAME').

connect_supports_feature(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_SUPPORTS_FEATURE', Arg).

domain_migrate_prepare(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_PREPARE', Arg).

domain_migrate_perform(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_PERFORM', Arg).

domain_migrate_finish(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_FINISH', Arg).

domain_block_stats(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_BLOCK_STATS',
		     Arg).

domain_interface_stats(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_INTERFACE_STATS', Arg).

auth_list(Ref) ->
    verx_client:call(Ref, 'REMOTE_PROC_AUTH_LIST').

auth_sasl_init(Ref) ->
    verx_client:call(Ref, 'REMOTE_PROC_AUTH_SASL_INIT').

auth_sasl_start(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_AUTH_SASL_START',
		     Arg).

auth_sasl_step(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_AUTH_SASL_STEP',
		     Arg).

auth_polkit(Ref) ->
    verx_client:call(Ref, 'REMOTE_PROC_AUTH_POLKIT').

connect_num_of_storage_pools(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NUM_OF_STORAGE_POOLS').

connect_list_storage_pools(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_STORAGE_POOLS', Arg).

connect_num_of_defined_storage_pools(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NUM_OF_DEFINED_STORAGE_POOLS').

connect_list_defined_storage_pools(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_DEFINED_STORAGE_POOLS', Arg).

connect_find_storage_pool_sources(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_FIND_STORAGE_POOL_SOURCES', Arg).

storage_pool_create_xml(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_CREATE_XML', Arg).

storage_pool_define_xml(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_DEFINE_XML', Arg).

storage_pool_create(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_STORAGE_POOL_CREATE',
		     Arg).

storage_pool_build(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_STORAGE_POOL_BUILD',
		     Arg).

storage_pool_destroy(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_DESTROY', Arg).

storage_pool_delete(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_STORAGE_POOL_DELETE',
		     Arg).

storage_pool_undefine(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_UNDEFINE', Arg).

storage_pool_refresh(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_REFRESH', Arg).

storage_pool_lookup_by_name(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_LOOKUP_BY_NAME', Arg).

storage_pool_lookup_by_uuid(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_LOOKUP_BY_UUID', Arg).

storage_pool_lookup_by_volume(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_LOOKUP_BY_VOLUME', Arg).

storage_pool_get_info(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_GET_INFO', Arg).

storage_pool_get_xml_desc(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_GET_XML_DESC', Arg).

storage_pool_get_autostart(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_GET_AUTOSTART', Arg).

storage_pool_set_autostart(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_SET_AUTOSTART', Arg).

storage_pool_num_of_volumes(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_NUM_OF_VOLUMES', Arg).

storage_pool_list_volumes(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_LIST_VOLUMES', Arg).

storage_vol_create_xml(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_VOL_CREATE_XML', Arg).

storage_vol_delete(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_STORAGE_VOL_DELETE',
		     Arg).

storage_vol_lookup_by_name(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_VOL_LOOKUP_BY_NAME', Arg).

storage_vol_lookup_by_key(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_VOL_LOOKUP_BY_KEY', Arg).

storage_vol_lookup_by_path(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_VOL_LOOKUP_BY_PATH', Arg).

storage_vol_get_info(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_VOL_GET_INFO', Arg).

storage_vol_get_xml_desc(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_VOL_GET_XML_DESC', Arg).

storage_vol_get_path(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_VOL_GET_PATH', Arg).

node_get_cells_free_memory(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_GET_CELLS_FREE_MEMORY', Arg).

node_get_free_memory(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_GET_FREE_MEMORY').

domain_block_peek(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_BLOCK_PEEK',
		     Arg).

domain_memory_peek(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_MEMORY_PEEK',
		     Arg).

connect_domain_event_register(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_DOMAIN_EVENT_REGISTER').

connect_domain_event_deregister(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_DOMAIN_EVENT_DEREGISTER').

domain_event_lifecycle(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_LIFECYCLE').

domain_migrate_prepare2(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_PREPARE2', Arg).

domain_migrate_finish2(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_FINISH2', Arg).

connect_get_uri(Ref) ->
    verx_client:call(Ref, 'REMOTE_PROC_CONNECT_GET_URI').

node_num_of_devices(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NODE_NUM_OF_DEVICES',
		     Arg).

node_list_devices(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NODE_LIST_DEVICES',
		     Arg).

node_device_lookup_by_name(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_DEVICE_LOOKUP_BY_NAME', Arg).

node_device_get_xml_desc(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_DEVICE_GET_XML_DESC', Arg).

node_device_get_parent(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_DEVICE_GET_PARENT', Arg).

node_device_num_of_caps(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_DEVICE_NUM_OF_CAPS', Arg).

node_device_list_caps(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_DEVICE_LIST_CAPS', Arg).

node_device_dettach(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NODE_DEVICE_DETTACH',
		     Arg).

node_device_re_attach(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_DEVICE_RE_ATTACH', Arg).

node_device_reset(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NODE_DEVICE_RESET',
		     Arg).

domain_get_security_label(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_SECURITY_LABEL', Arg).

node_get_security_model(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_GET_SECURITY_MODEL').

node_device_create_xml(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_DEVICE_CREATE_XML', Arg).

node_device_destroy(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NODE_DEVICE_DESTROY',
		     Arg).

storage_vol_create_xml_from(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_VOL_CREATE_XML_FROM', Arg).

connect_num_of_interfaces(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NUM_OF_INTERFACES').

connect_list_interfaces(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_INTERFACES', Arg).

interface_lookup_by_name(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_INTERFACE_LOOKUP_BY_NAME', Arg).

interface_lookup_by_mac_string(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_INTERFACE_LOOKUP_BY_MAC_STRING', Arg).

interface_get_xml_desc(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_INTERFACE_GET_XML_DESC', Arg).

interface_define_xml(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_INTERFACE_DEFINE_XML', Arg).

interface_undefine(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_INTERFACE_UNDEFINE',
		     Arg).

interface_create(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_INTERFACE_CREATE',
		     Arg).

interface_destroy(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_INTERFACE_DESTROY',
		     Arg).

connect_domain_xml_from_native(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_DOMAIN_XML_FROM_NATIVE', Arg).

connect_domain_xml_to_native(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_DOMAIN_XML_TO_NATIVE', Arg).

connect_num_of_defined_interfaces(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NUM_OF_DEFINED_INTERFACES').

connect_list_defined_interfaces(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_DEFINED_INTERFACES', Arg).

connect_num_of_secrets(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NUM_OF_SECRETS').

connect_list_secrets(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_SECRETS', Arg).

secret_lookup_by_uuid(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_SECRET_LOOKUP_BY_UUID', Arg).

secret_define_xml(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_SECRET_DEFINE_XML',
		     Arg).

secret_get_xml_desc(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_SECRET_GET_XML_DESC',
		     Arg).

secret_set_value(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_SECRET_SET_VALUE',
		     Arg).

secret_get_value(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_SECRET_GET_VALUE',
		     Arg).

secret_undefine(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_SECRET_UNDEFINE',
		     Arg).

secret_lookup_by_usage(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_SECRET_LOOKUP_BY_USAGE', Arg).

domain_migrate_prepare_tunnel(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_PREPARE_TUNNEL', Arg).

connect_is_secure(Ref) ->
    verx_client:call(Ref, 'REMOTE_PROC_CONNECT_IS_SECURE').

domain_is_active(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_IS_ACTIVE',
		     Arg).

domain_is_persistent(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_IS_PERSISTENT', Arg).

network_is_active(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NETWORK_IS_ACTIVE',
		     Arg).

network_is_persistent(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NETWORK_IS_PERSISTENT', Arg).

storage_pool_is_active(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_IS_ACTIVE', Arg).

storage_pool_is_persistent(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_IS_PERSISTENT', Arg).

interface_is_active(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_INTERFACE_IS_ACTIVE',
		     Arg).

connect_get_lib_version(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_GET_LIB_VERSION').

connect_compare_cpu(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_CONNECT_COMPARE_CPU',
		     Arg).

domain_memory_stats(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_MEMORY_STATS',
		     Arg).

domain_attach_device_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_ATTACH_DEVICE_FLAGS', Arg).

domain_detach_device_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_DETACH_DEVICE_FLAGS', Arg).

connect_baseline_cpu(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_BASELINE_CPU', Arg).

domain_get_job_info(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_GET_JOB_INFO',
		     Arg).

domain_abort_job(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_ABORT_JOB',
		     Arg).

storage_vol_wipe(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_STORAGE_VOL_WIPE',
		     Arg).

domain_migrate_set_max_downtime(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_SET_MAX_DOWNTIME', Arg).

connect_domain_event_register_any(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_DOMAIN_EVENT_REGISTER_ANY', Arg).

connect_domain_event_deregister_any(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_DOMAIN_EVENT_DEREGISTER_ANY', Arg).

domain_event_reboot(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_REBOOT').

domain_event_rtc_change(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_RTC_CHANGE').

domain_event_watchdog(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_WATCHDOG').

domain_event_io_error(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_IO_ERROR').

domain_event_graphics(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_GRAPHICS').

domain_update_device_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_UPDATE_DEVICE_FLAGS', Arg).

nwfilter_lookup_by_name(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NWFILTER_LOOKUP_BY_NAME', Arg).

nwfilter_lookup_by_uuid(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NWFILTER_LOOKUP_BY_UUID', Arg).

nwfilter_get_xml_desc(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NWFILTER_GET_XML_DESC', Arg).

connect_num_of_nwfilters(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NUM_OF_NWFILTERS').

connect_list_nwfilters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_NWFILTERS', Arg).

nwfilter_define_xml(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NWFILTER_DEFINE_XML',
		     Arg).

nwfilter_undefine(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NWFILTER_UNDEFINE',
		     Arg).

domain_managed_save(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_MANAGED_SAVE',
		     Arg).

domain_has_managed_save_image(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_HAS_MANAGED_SAVE_IMAGE', Arg).

domain_managed_save_remove(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MANAGED_SAVE_REMOVE', Arg).

domain_snapshot_create_xml(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_CREATE_XML', Arg).

domain_snapshot_get_xml_desc(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_GET_XML_DESC', Arg).

domain_snapshot_num(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_SNAPSHOT_NUM',
		     Arg).

domain_snapshot_list_names(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_LIST_NAMES', Arg).

domain_snapshot_lookup_by_name(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_LOOKUP_BY_NAME', Arg).

domain_has_current_snapshot(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_HAS_CURRENT_SNAPSHOT', Arg).

domain_snapshot_current(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_CURRENT', Arg).

domain_revert_to_snapshot(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_REVERT_TO_SNAPSHOT', Arg).

domain_snapshot_delete(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_DELETE', Arg).

domain_get_block_info(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_BLOCK_INFO', Arg).

domain_event_io_error_reason(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_IO_ERROR_REASON').

domain_create_with_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_CREATE_WITH_FLAGS', Arg).

domain_set_memory_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_MEMORY_PARAMETERS', Arg).

domain_get_memory_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_MEMORY_PARAMETERS', Arg).

domain_set_vcpus_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_VCPUS_FLAGS', Arg).

domain_get_vcpus_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_VCPUS_FLAGS', Arg).

domain_open_console(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_OPEN_CONSOLE',
		     Arg).

domain_is_updated(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_IS_UPDATED',
		     Arg).

connect_get_sysinfo(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_CONNECT_GET_SYSINFO',
		     Arg).

domain_set_memory_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_MEMORY_FLAGS', Arg).

domain_set_blkio_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_BLKIO_PARAMETERS', Arg).

domain_get_blkio_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_BLKIO_PARAMETERS', Arg).

domain_migrate_set_max_speed(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_SET_MAX_SPEED', Arg).

storage_vol_upload(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_STORAGE_VOL_UPLOAD',
		     Arg).

storage_vol_download(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_VOL_DOWNLOAD', Arg).

domain_inject_nmi(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_INJECT_NMI',
		     Arg).

domain_screenshot(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_SCREENSHOT',
		     Arg).

domain_get_state(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_GET_STATE',
		     Arg).

domain_migrate_begin3(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_BEGIN3', Arg).

domain_migrate_prepare3(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_PREPARE3', Arg).

domain_migrate_prepare_tunnel3(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_PREPARE_TUNNEL3', Arg).

domain_migrate_perform3(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_PERFORM3', Arg).

domain_migrate_finish3(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_FINISH3', Arg).

domain_migrate_confirm3(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_CONFIRM3', Arg).

domain_set_scheduler_parameters_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_SCHEDULER_PARAMETERS_FLAGS',
		     Arg).

interface_change_begin(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_INTERFACE_CHANGE_BEGIN', Arg).

interface_change_commit(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_INTERFACE_CHANGE_COMMIT', Arg).

interface_change_rollback(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_INTERFACE_CHANGE_ROLLBACK', Arg).

domain_get_scheduler_parameters_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_SCHEDULER_PARAMETERS_FLAGS',
		     Arg).

domain_event_control_error(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CONTROL_ERROR').

domain_pin_vcpu_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_PIN_VCPU_FLAGS', Arg).

domain_send_key(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_SEND_KEY',
		     Arg).

node_get_cpu_stats(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NODE_GET_CPU_STATS',
		     Arg).

node_get_memory_stats(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_GET_MEMORY_STATS', Arg).

domain_get_control_info(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_CONTROL_INFO', Arg).

domain_get_vcpu_pin_info(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_VCPU_PIN_INFO', Arg).

domain_undefine_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_UNDEFINE_FLAGS', Arg).

domain_save_flags(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_SAVE_FLAGS',
		     Arg).

domain_restore_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_RESTORE_FLAGS', Arg).

domain_destroy_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_DESTROY_FLAGS', Arg).

domain_save_image_get_xml_desc(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SAVE_IMAGE_GET_XML_DESC', Arg).

domain_save_image_define_xml(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SAVE_IMAGE_DEFINE_XML', Arg).

domain_block_job_abort(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_BLOCK_JOB_ABORT', Arg).

domain_get_block_job_info(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_BLOCK_JOB_INFO', Arg).

domain_block_job_set_speed(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_BLOCK_JOB_SET_SPEED', Arg).

domain_block_pull(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_BLOCK_PULL',
		     Arg).

domain_event_block_job(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_BLOCK_JOB').

domain_migrate_get_max_speed(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_GET_MAX_SPEED', Arg).

domain_block_stats_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_BLOCK_STATS_FLAGS', Arg).

domain_snapshot_get_parent(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_GET_PARENT', Arg).

domain_reset(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_RESET', Arg).

domain_snapshot_num_children(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_NUM_CHILDREN', Arg).

domain_snapshot_list_children_names(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_LIST_CHILDREN_NAMES', Arg).

domain_event_disk_change(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_DISK_CHANGE').

domain_open_graphics(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_OPEN_GRAPHICS', Arg).

node_suspend_for_duration(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_SUSPEND_FOR_DURATION', Arg).

domain_block_resize(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_BLOCK_RESIZE',
		     Arg).

domain_set_block_io_tune(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_BLOCK_IO_TUNE', Arg).

domain_get_block_io_tune(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_BLOCK_IO_TUNE', Arg).

domain_set_numa_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_NUMA_PARAMETERS', Arg).

domain_get_numa_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_NUMA_PARAMETERS', Arg).

domain_set_interface_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_INTERFACE_PARAMETERS', Arg).

domain_get_interface_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_INTERFACE_PARAMETERS', Arg).

domain_shutdown_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SHUTDOWN_FLAGS', Arg).

storage_vol_wipe_pattern(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_VOL_WIPE_PATTERN', Arg).

storage_vol_resize(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_STORAGE_VOL_RESIZE',
		     Arg).

domain_pm_suspend_for_duration(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_PM_SUSPEND_FOR_DURATION', Arg).

domain_get_cpu_stats(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_CPU_STATS', Arg).

domain_get_disk_errors(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_DISK_ERRORS', Arg).

domain_set_metadata(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_SET_METADATA',
		     Arg).

domain_get_metadata(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_GET_METADATA',
		     Arg).

domain_block_rebase(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_BLOCK_REBASE',
		     Arg).

domain_pm_wakeup(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_PM_WAKEUP',
		     Arg).

domain_event_tray_change(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_TRAY_CHANGE').

domain_event_pmwakeup(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_PMWAKEUP').

domain_event_pmsuspend(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_PMSUSPEND').

domain_snapshot_is_current(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_IS_CURRENT', Arg).

domain_snapshot_has_metadata(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_HAS_METADATA', Arg).

connect_list_all_domains(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_ALL_DOMAINS', Arg).

domain_list_all_snapshots(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_LIST_ALL_SNAPSHOTS', Arg).

domain_snapshot_list_all_children(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SNAPSHOT_LIST_ALL_CHILDREN', Arg).

domain_event_balloon_change(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_BALLOON_CHANGE').

domain_get_hostname(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_GET_HOSTNAME',
		     Arg).

domain_get_security_label_list(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_SECURITY_LABEL_LIST', Arg).

domain_pin_emulator(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_PIN_EMULATOR',
		     Arg).

domain_get_emulator_pin_info(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_EMULATOR_PIN_INFO', Arg).

connect_list_all_storage_pools(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_ALL_STORAGE_POOLS', Arg).

storage_pool_list_all_volumes(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_STORAGE_POOL_LIST_ALL_VOLUMES', Arg).

connect_list_all_networks(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_ALL_NETWORKS', Arg).

connect_list_all_interfaces(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_ALL_INTERFACES', Arg).

connect_list_all_node_devices(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_ALL_NODE_DEVICES', Arg).

connect_list_all_nwfilters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_ALL_NWFILTERS', Arg).

connect_list_all_secrets(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_LIST_ALL_SECRETS', Arg).

node_set_memory_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_SET_MEMORY_PARAMETERS', Arg).

node_get_memory_parameters(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_GET_MEMORY_PARAMETERS', Arg).

domain_block_commit(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_BLOCK_COMMIT',
		     Arg).

network_update(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NETWORK_UPDATE',
		     Arg).

domain_event_pmsuspend_disk(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_PMSUSPEND_DISK').

node_get_cpu_map(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NODE_GET_CPU_MAP',
		     Arg).

domain_fstrim(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_FSTRIM', Arg).

domain_send_process_signal(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SEND_PROCESS_SIGNAL', Arg).

domain_open_channel(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_OPEN_CHANNEL',
		     Arg).

node_device_lookup_scsi_host_by_wwn(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_DEVICE_LOOKUP_SCSI_HOST_BY_WWN', Arg).

domain_get_job_stats(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_JOB_STATS', Arg).

domain_migrate_get_compression_cache(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_GET_COMPRESSION_CACHE',
		     Arg).

domain_migrate_set_compression_cache(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_SET_COMPRESSION_CACHE',
		     Arg).

node_device_detach_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NODE_DEVICE_DETACH_FLAGS', Arg).

domain_migrate_begin3_params(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_BEGIN3_PARAMS', Arg).

domain_migrate_prepare3_params(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_PREPARE3_PARAMS', Arg).

domain_migrate_prepare_tunnel3_params(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_PREPARE_TUNNEL3_PARAMS',
		     Arg).

domain_migrate_perform3_params(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_PERFORM3_PARAMS', Arg).

domain_migrate_finish3_params(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_FINISH3_PARAMS', Arg).

domain_migrate_confirm3_params(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_MIGRATE_CONFIRM3_PARAMS', Arg).

domain_set_memory_stats_period(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_MEMORY_STATS_PERIOD', Arg).

domain_create_xml_with_files(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_CREATE_XML_WITH_FILES', Arg).

domain_create_with_files(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_CREATE_WITH_FILES', Arg).

domain_event_device_removed(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_DEVICE_REMOVED').

connect_get_cpu_model_names(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_GET_CPU_MODEL_NAMES', Arg).

connect_network_event_register_any(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NETWORK_EVENT_REGISTER_ANY', Arg).

connect_network_event_deregister_any(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_NETWORK_EVENT_DEREGISTER_ANY',
		     Arg).

network_event_lifecycle(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NETWORK_EVENT_LIFECYCLE').

connect_domain_event_callback_register_any(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_DOMAIN_EVENT_CALLBACK_REGISTER_ANY',
		     Arg).

connect_domain_event_callback_deregister_any(Ref,
					     Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_DOMAIN_EVENT_CALLBACK_DEREGISTER_ANY',
		     Arg).

domain_event_callback_lifecycle(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_LIFECYCLE').

domain_event_callback_reboot(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_REBOOT').

domain_event_callback_rtc_change(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_RTC_CHANGE').

domain_event_callback_watchdog(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_WATCHDOG').

domain_event_callback_io_error(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_IO_ERROR').

domain_event_callback_graphics(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_GRAPHICS').

domain_event_callback_io_error_reason(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_IO_ERROR_REASON').

domain_event_callback_control_error(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_CONTROL_ERROR').

domain_event_callback_block_job(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_BLOCK_JOB').

domain_event_callback_disk_change(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_DISK_CHANGE').

domain_event_callback_tray_change(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_TRAY_CHANGE').

domain_event_callback_pmwakeup(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_PMWAKEUP').

domain_event_callback_pmsuspend(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_PMSUSPEND').

domain_event_callback_balloon_change(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_BALLOON_CHANGE').

domain_event_callback_pmsuspend_disk(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_PMSUSPEND_DISK').

domain_event_callback_device_removed(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_DEVICE_REMOVED').

domain_core_dump_with_format(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_CORE_DUMP_WITH_FORMAT', Arg).

domain_fsfreeze(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_FSFREEZE',
		     Arg).

domain_fsthaw(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_FSTHAW', Arg).

domain_get_time(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_GET_TIME',
		     Arg).

domain_set_time(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_SET_TIME',
		     Arg).

domain_event_block_job_2(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_BLOCK_JOB_2').

node_get_free_pages(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NODE_GET_FREE_PAGES',
		     Arg).

network_get_dhcp_leases(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_NETWORK_GET_DHCP_LEASES', Arg).

connect_get_domain_capabilities(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_GET_DOMAIN_CAPABILITIES', Arg).

domain_open_graphics_fd(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_OPEN_GRAPHICS_FD', Arg).

connect_get_all_domain_stats(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_CONNECT_GET_ALL_DOMAIN_STATS', Arg).

domain_block_copy(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_BLOCK_COPY',
		     Arg).

domain_event_callback_tunable(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_TUNABLE').

node_alloc_pages(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_NODE_ALLOC_PAGES',
		     Arg).

domain_event_callback_agent_lifecycle(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_AGENT_LIFECYCLE').

domain_get_fsinfo(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_GET_FSINFO',
		     Arg).

domain_define_xml_flags(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_DEFINE_XML_FLAGS', Arg).

domain_get_iothread_info(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_GET_IOTHREAD_INFO', Arg).

domain_pin_iothread(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_PIN_IOTHREAD',
		     Arg).

domain_interface_addresses(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_INTERFACE_ADDRESSES', Arg).

domain_event_callback_device_added(Ref) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_EVENT_CALLBACK_DEVICE_ADDED').

domain_add_iothread(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_ADD_IOTHREAD',
		     Arg).

domain_del_iothread(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_DEL_IOTHREAD',
		     Arg).

domain_set_user_password(Ref, Arg) ->
    verx_client:call(Ref,
		     'REMOTE_PROC_DOMAIN_SET_USER_PASSWORD', Arg).

domain_rename(Ref, Arg) ->
    verx_client:call(Ref, 'REMOTE_PROC_DOMAIN_RENAME', Arg).
