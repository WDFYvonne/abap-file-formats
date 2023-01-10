INTERFACE zif_aff_sush_v1
  PUBLIC .

  TYPES:
    "! <p class="shorttext">Maintenance Mode</p>
    "! Maintenance Mode
    "! $values {@link zif_aff_sush_v1.data:co_maintenance_mode}
    ty_maintenance_mode   TYPE c LENGTH 1,
    "! <p class="shorttext">Maintenance Status</p>
    "! Maintenance Status
    "! $values {@link zif_aff_sush_v1.data:co_maintenance_status}
    "! $default {@link zif_aff_sush_v1.data:co_maintenance_status.y_flag}
    ty_maintenance_status TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Maintenance Mode</p>
    "! Maintenance Mode
    BEGIN OF co_maintenance_mode,
      "! <p class="shorttext">Manual Maintenance</p>
      "! Manual Maintenance
      manual TYPE ty_maintenance_mode VALUE space,
      "! <p class="shorttext">Autom. Maintenance (All Objects)</p>
      "! Autom. Maintenance (All Objects)
      a_flag TYPE ty_maintenance_mode VALUE 'A',
      "! <p class="shorttext">Automatic Maintenance (Basis Authorization Objects Only)</p>
      "! Automatic Maintenance (Basis Authorization Objects Only)
      b_flag TYPE ty_maintenance_mode VALUE 'B',
      "! <p class="shorttext">Application Does Not Require Default Values</p>
      "! Application Does Not Require Default Values
      i_flag TYPE ty_maintenance_mode VALUE 'I',
      "! <p class="shorttext">Application is Deprecated</p>
      "! Application is Deprecated
      d_flag TYPE ty_maintenance_mode VALUE 'D',
      "! <p class="shorttext">Application Is Obsolete</p>
      "! Application Is Obsolete
      o_flag TYPE ty_maintenance_mode VALUE 'O',
    END OF co_maintenance_mode,

    "! <p class="shorttext">Maintenance Status</p>
    "! Maintenance Status
    BEGIN OF co_maintenance_status,
      "! <p class="shorttext">No Default</p>
      "! No Default
      x_flag TYPE ty_maintenance_status VALUE 'X',
      "! <p class="shorttext">Default With Field Values</p>
      "! Default With Field Values
      y_flag TYPE ty_maintenance_status VALUE 'Y',
      "! <p class="shorttext">Default Without Field Values</p>
      "! Default Without Field Values
      v_flag TYPE ty_maintenance_status VALUE 'V',
      "! <p class="shorttext">Default Inactive</p>
      "! Default Inactive
      i_flag TYPE ty_maintenance_status VALUE 'I',
      "! <p class="shorttext">Unmaintained Object Status</p>
      "! Unmaintained Object Status
      u_flag TYPE ty_maintenance_status VALUE 'U',
      "! <p class="shorttext">Authorization Check Inactive</p>
      "! Authorization Check Inactive
      n_flag TYPE ty_maintenance_status VALUE 'N',
    END OF co_maintenance_status.

  TYPES:
    "! <p class="shorttext">Application Name</p>
    "! Name of Application
    ty_name TYPE c LENGTH 30,
    "! <p class="shorttext">Application Type</p>
    "! Type of Application
    ty_type TYPE c LENGTH 2.

  TYPES:
    "! <p class="shorttext">General</p>
    "! General
    "! $required
    BEGIN OF ty_general,
      "! <p class="shorttext">Application Name</p>
      "! Application Name of Authorization Default Value.
      "! $required
      name             TYPE ty_name,
      "! <p class="shorttext">Type</p>
      "! Type of Authorization Default Value.
      "! $required
      type             TYPE ty_type,
      "! <p class="shorttext">Maintenance Mode</p>
      "! Maintenance Mode.
      "! $values {@link zif_aff_sush_v1.data:co_maintenance_mode}
      "! $required
      maintenance_mode TYPE ty_maintenance_mode,
    END OF ty_general .

  TYPES:
    "! <p class="shorttext">Authorization Value</p>
    "! Authorization Value
    ty_val TYPE c LENGTH 40.

  TYPES:
    "! <p class="shorttext">Default Authorization Values</p>
    "! Default Authorization Values
    BEGIN OF ty_value,
      "! <p class="shorttext">From</p>
      "! From Value
      "! $showAlways
      low  TYPE ty_val,
      "! <p class="shorttext">To</p>
      "! To Values
      "! $showAlways
      high TYPE ty_val,
    END OF ty_value .

  TYPES:
    "! <p class="shorttext">Authorization Fields</p>
    "! Authorization Fields
    ty_values  TYPE STANDARD TABLE OF ty_value WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Authorization Field</p>
    "! Authorization Field
    ty_field TYPE c LENGTH 10.

  TYPES:
    "! <p class="shorttext">Authorization Field Details</p>
    "! Authorization Field Details
    BEGIN OF ty_authorization_field,
      "! <p class="shorttext">Field</p>
      "! Name of Authorization Field
      "! $required
      field  TYPE ty_field,
      "! <p class="shorttext">Values</p>
      "! Name of Authorization Field Value
      values TYPE ty_values,
    END OF ty_authorization_field .

  TYPES:
    "! <p class="shorttext">Authorization Fields</p>
    "! Authorization Fields
    ty_authorization_fields  TYPE STANDARD TABLE OF ty_authorization_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Authorization Objects Details</p>
    "! Authorization Objects Details
    BEGIN OF ty_authorization_object,
      "! <p class="shorttext">Object</p>
      "! Name of Authorization Object
      "! $required
      object             TYPE c LENGTH 10,
      "! <p class="shorttext">Maintenance Status</p>
      "! Maintenance Status
      "! $values {@link zif_aff_sush_v1.data:co_maintenance_status}
      "! $default {@link zif_aff_sush_v1.data:co_maintenance_status.y_flag}
      "! $showAlways
      maintenance_status TYPE ty_maintenance_status,
      "! <p class="shorttext">Fields</p>
      "! Authorization Fields.
      "! $showAlways
      fields             TYPE ty_authorization_fields,

    END OF ty_authorization_object .

  TYPES:
  "! <p class="shorttext">Authorization Objects</p>
  "! Authorization Objects
    ty_authorization_objects TYPE STANDARD TABLE OF ty_authorization_object WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">SUSH Object Type</p>
    "! Object type SUSH
    BEGIN OF  ty_main,
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">General</p>
      "! General
      "! $required
      general               TYPE ty_general,
      "! <p class="shorttext">Authorization objects</p>
      "! Authorization objects
      authorization_objects TYPE ty_authorization_objects,
    END OF ty_main .

ENDINTERFACE.
