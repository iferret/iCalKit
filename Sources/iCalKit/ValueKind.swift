//
//  ValueKind.swift
//  
//
//  Created by iferret's on 2023/4/13.
//

import Foundation
import libical

public typealias ValueKind = Wrap<icalvalue_kind>
extension ValueKind {
    /// ICAL_ANY_VALUE
    public static var ANY: ValueKind { .init(rawValue: ICAL_ANY_VALUE) }
    /// ICAL_ACTION_VALUE
    public static var ACTION: ValueKind { .init(rawValue: ICAL_ACTION_VALUE) }
    /// ICAL_ATTACH_VALUE
    public static var ATTACH: ValueKind { .init(rawValue: ICAL_ATTACH_VALUE) }
    /// ICAL_BINARY_VALUE
    public static var BINARY: ValueKind { .init(rawValue: ICAL_BINARY_VALUE) }
    /// ICAL_BOOLEAN_VALUE
    public static var BOOLEAN: ValueKind { .init(rawValue: ICAL_BOOLEAN_VALUE) }
    /// ICAL_BUSYTYPE_VALUE
    public static var BUSYTYPE: ValueKind { .init(rawValue: ICAL_BUSYTYPE_VALUE) }
    /// ICAL_CALADDRESS_VALUE
    public static var CALADDRESS: ValueKind { .init(rawValue: ICAL_CALADDRESS_VALUE) }
    /// ICAL_CARLEVEL_VALUE
    public static var CARLEVEL: ValueKind { .init(rawValue: ICAL_CARLEVEL_VALUE) }
    /// ICAL_CLASS_VALUE
    public static var CLASS: ValueKind { .init(rawValue: ICAL_CLASS_VALUE) }
    /// ICAL_CMD_VALUE
    public static var CMD: ValueKind { .init(rawValue: ICAL_CMD_VALUE) }
    /// ICAL_DATE_VALUE
    public static var DATE: ValueKind { .init(rawValue: ICAL_DATE_VALUE) }
    /// ICAL_DATETIME_VALUE
    public static var DATETIME: ValueKind { .init(rawValue: ICAL_DATETIME_VALUE) }
    /// ICAL_DATETIMEDATE_VALUE
    public static var DATETIMEDATE: ValueKind { .init(rawValue: ICAL_DATETIMEDATE_VALUE) }
    /// ICAL_DATETIMEPERIOD_VALUE
    public static var DATETIMEPERIOD: ValueKind { .init(rawValue: ICAL_DATETIMEPERIOD_VALUE) }
    /// ICAL_DURATION_VALUE
    public static var DURATION: ValueKind { .init(rawValue: ICAL_DURATION_VALUE) }
    /// ICAL_FLOAT_VALUE
    public static var FLOAT: ValueKind { .init(rawValue: ICAL_FLOAT_VALUE) }
    /// ICAL_GEO_VALUE
    public static var GEO: ValueKind { .init(rawValue: ICAL_GEO_VALUE) }
    /// ICAL_INTEGER_VALUE
    public static var INTEGER: ValueKind { .init(rawValue: ICAL_INTEGER_VALUE) }
    /// ICAL_METHOD_VALUE
    public static var METHOD: ValueKind { .init(rawValue: ICAL_METHOD_VALUE) }
    /// ICAL_PERIOD_VALUE
    public static var PERIOD: ValueKind { .init(rawValue: ICAL_PERIOD_VALUE) }
    /// ICAL_POLLCOMPLETION_VALUE
    public static var POLLCOMPLETION: ValueKind { .init(rawValue: ICAL_POLLCOMPLETION_VALUE) }
    /// ICAL_POLLMODE_VALUE
    public static var POLLMODE: ValueKind { .init(rawValue: ICAL_POLLMODE_VALUE) }
    /// ICAL_QUERY_VALUE
    public static var QUERY: ValueKind { .init(rawValue: ICAL_QUERY_VALUE) }
    /// ICAL_QUERYLEVEL_VALUE
    public static var QUERYLEVEL: ValueKind { .init(rawValue: ICAL_QUERYLEVEL_VALUE) }
    /// ICAL_RECUR_VALUE
    public static var RECUR: ValueKind { .init(rawValue: ICAL_RECUR_VALUE) }
    /// ICAL_REQUESTSTATUS_VALUE
    public static var REQUESTSTATUS: ValueKind { .init(rawValue: ICAL_REQUESTSTATUS_VALUE) }
    /// ICAL_STATUS_VALUE
    public static var STATUS: ValueKind { .init(rawValue: ICAL_STATUS_VALUE) }
    /// ICAL_STRING_VALUE
    public static var STRING: ValueKind { .init(rawValue: ICAL_STRING_VALUE) }
    /// ICAL_TASKMODE_VALUE
    public static var TASKMODE: ValueKind { .init(rawValue: ICAL_TASKMODE_VALUE) }
    /// ICAL_TEXT_VALUE
    public static var TEXT: ValueKind { .init(rawValue: ICAL_TEXT_VALUE) }
    /// ICAL_TRANSP_VALUE
    public static var TRANSP: ValueKind { .init(rawValue: ICAL_TRANSP_VALUE) }
    /// ICAL_TRIGGER_VALUE
    public static var TRIGGER: ValueKind { .init(rawValue: ICAL_TRIGGER_VALUE) }
    /// ICAL_URI_VALUE
    public static var URI: ValueKind { .init(rawValue: ICAL_URI_VALUE) }
    /// ICAL_UTCOFFSET_VALUE
    public static var UTCOFFSET: ValueKind { .init(rawValue: ICAL_UTCOFFSET_VALUE) }
    /// ICAL_X_VALUE
    public static var X: ValueKind { .init(rawValue: ICAL_X_VALUE) }
    /// ICAL_XLICCLASS_VALUE
    public static var XLICCLASS: ValueKind { .init(rawValue: ICAL_XLICCLASS_VALUE) }
    /// ICAL_NO_VALUE
    public static var NO: ValueKind { .init(rawValue: ICAL_NO_VALUE) }
    /// [ValueKind]
    public static var allCases: [ValueKind] {
        return [ANY, ACTION, ATTACH, BINARY, BOOLEAN, BUSYTYPE, CALADDRESS, CARLEVEL, CLASS, CMD, DATE, DATETIME, DATETIMEDATE, DATETIMEPERIOD, DURATION, FLOAT, GEO, INTEGER, METHOD, PERIOD, POLLCOMPLETION, POLLMODE, QUERY, QUERYLEVEL, RECUR, REQUESTSTATUS, STATUS, STRING, TASKMODE, TEXT, TRANSP, TRIGGER, URI, UTCOFFSET, X, XLICCLASS, NO]
    }

}

