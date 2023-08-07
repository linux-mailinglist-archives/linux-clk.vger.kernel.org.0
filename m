Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4EB37734AD
	for <lists+linux-clk@lfdr.de>; Tue,  8 Aug 2023 01:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjHGXLj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 7 Aug 2023 19:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjHGXLX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Aug 2023 19:11:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BCFF30FC;
        Mon,  7 Aug 2023 16:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691449755; x=1722985755;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X+EBfCWuttTi30h4bfff97doqJN+1vnLYZoSC8zqgCU=;
  b=Tz73j1pHLdqEZd60QrGoP+G0c1rLfpu6AMuGkai6MOGj/167WiTZmlG7
   bqciCkHXhjNVX469V43nPNjkZv9c4SfX0hMtoJt/W7m4MaGfKRfuu4dUc
   6Mah7zAcDTNXTSZhWXFM4xbSX2vvBNmynLAQAh7dZI4Cx+G7cyIEMDGgu
   0tk+uhwBOK51qe9rx5fmyPEIQ++zMp+Dkp7Jj/tjnTNzRQXQYZdxLG6LR
   knG3QCKbbbXOyiE1uwh6Y0jqBj0e43k22W60Yhi1NnGiiFVVSmG+6bLyh
   S3rFZx+61arneg3uPMF8itH01wLyWCBL9K/fIrILw75T7cxc1/fQHpASN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401631686"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="401631686"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 16:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796501506"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="796501506"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP; 07 Aug 2023 16:08:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 16:08:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 16:08:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 16:08:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 16:08:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHbnoCTun3xQ+KKB4ayXzTXM5J76OJSLDdGhZV15uBcPJgumsBHpjPrgFuqrskTiX7+VcaLxcJzcmWxWtWH8aQKAI3NUvZXjbuVD6hqg2K5nnOp9YbewgfXNAuS62f1px7FOXBTlBFsXdiMdWcj3tMkZGJmrgxLrCGAyMmVvcHvENk8sW2N6qwifx3Q5K1VQzOf1e6VtJ+H8fOG7DB/T47tVOcADxvfYnaR2ruMX+HoIuot/UxDPTS5i9/kpkkWaXDlhzt1W/0UhWcwAhLArfz1ckbyzikuNRB1ZM1bdANQgoVdW2p30F2qGyclMcyUNZCM0aeuo+h7SxOuMYpNMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z45MZ0BD0WkXyg8lIwRSEiD8/5T4R9pLPvu1DAcSg1A=;
 b=F9URBuHxIYSqZqdVyEUYlszuwNlyy0FQaTjLDb0TV6jUvV+kfJ7bLlCtXOAbVhQXVwdecGwe6AtClzA5/nl1GSjO+GiNg6z4KqLfY/el8VTdUITEgaXq8xITyp1mI6XzAD+u8I6Y7QO9f2c7ordvlPV0aexsrDzpC1RP1jZxfr3nZ3f//9ZmRMDRKAKP6ayXJ6nkTllkBCJpcmxm3oIemd28HfB/h+7g5nYkT5GxuQY8dJmqZJ0Lim9LxrXKaE84mV4EDmkLslRN4KeNtCAImBETNN+ru4kpI9I5ch+yGkvPzmyRASCDjogzh0FqBjVbQXz9faPtjgZhurOZZLImjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) by
 CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.21; Mon, 7 Aug 2023 23:08:13 +0000
Received: from DM6PR11MB4657.namprd11.prod.outlook.com
 ([fe80::c3cd:b8d0:5231:33a8]) by DM6PR11MB4657.namprd11.prod.outlook.com
 ([fe80::c3cd:b8d0:5231:33a8%5]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 23:08:13 +0000
From:   "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
To:     Simon Horman <horms@kernel.org>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>
CC:     Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
        "Jonathan Lemon" <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Bart Van Assche <bvanassche@acm.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
Subject: RE: [PATCH net-next v2 6/9] ice: add admin commands to access cgu
 configuration
Thread-Topic: [PATCH net-next v2 6/9] ice: add admin commands to access cgu
 configuration
Thread-Index: AQHZxwbCEAx9MO6vs0irTseMzSA5w6/diaoAgAHv6PA=
Date:   Mon, 7 Aug 2023 23:08:13 +0000
Message-ID: <DM6PR11MB46577E9609111FDE34A4F7469B0CA@DM6PR11MB4657.namprd11.prod.outlook.com>
References: <20230804190454.394062-1-vadim.fedorenko@linux.dev>
 <20230804190454.394062-7-vadim.fedorenko@linux.dev>
 <ZM/Y/PjPVNxbwLOL@vergenet.net>
In-Reply-To: <ZM/Y/PjPVNxbwLOL@vergenet.net>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4657:EE_|CY8PR11MB7685:EE_
x-ms-office365-filtering-correlation-id: 1c9eeef2-35d7-43a6-e66a-08db979b2ce4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o5b9lpmE0YU36AmMnnjYta9YZBqt5OTZBIzInx3RzbfI43Ztl37bBV6Jbomp5AVvlrB01zXQ9ayJCyfes9lT5fniZxGmjH3/ts6uopqIiAt+YEGB8X/VZ4eOTvWfPQXjm94sBkRrbkKnr9b60Sqm20zmM4CsBupNCZKLSv3OiHx3teGG4N/0UwUYzwht28vWRXFTa1LIx933VlIBbqx+ZRhbQL2VznqRQogfQ08Ng4uuYCxAgbOgBeoHM7+5JbfyEkkxPF3lcVgqaj7mNrAsLlCDPIi5xRNGFe6OyitCGsjKMTVI3cYzFBmrjm7axeI19vHWdUpKMy/HZyXRFutqZVfyDisQawA1mR8GHihsyMgChh8ZV+03t7Y+5DcNW4FPN1UnXF9vJNM1qj2ISMnceo2LaU1afhzN+EV4Qjcf+kmXmeXLXt0xe/sNlQFSSIDpZCA7PEn3hbzo52w6uRXD3FViEh9kh7NZlvWEX3SvMYv0tqe2CLMq9IJ/R5jTi2iW/+NvCyOQ2zw3FyYoLmkUFjWhI/Brc58q+DQSY1RyfR3+rMca9hWvXPBHEgDxeAHQWELBtRh5cQy8nrUNIx03XGZI0Jk8XkqkhDMTaeprmNeqn59SLkeYoghMFrSDgKNnY6i8vSPP3SoEUPncL3T9LCOwBfiuKGiOQDi9OLTEpKzE2RZoe0uzDV+G/ewDjxxN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(90011799007)(90021799007)(186006)(1800799003)(55016003)(9686003)(4326008)(316002)(86362001)(478600001)(122000001)(54906003)(110136005)(38100700002)(71200400001)(76116006)(66946007)(6506007)(82960400001)(66446008)(66476007)(64756008)(66556008)(33656002)(7696005)(41300700001)(26005)(52536014)(38070700005)(8936002)(8676002)(2906002)(83380400001)(7416002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UHifpVNQuV8ujsPXEaSOq9dR3+gzEGTEIQ4b0VnQG0D77e6AGNZfetxpznMQ?=
 =?us-ascii?Q?VJCCcRpI3gdhMxtbkImcndO6DNBpw9qVqhPzeryU3lHF6d+xJKJNMFPfJGUt?=
 =?us-ascii?Q?qsNMAimx7n0pnWCJZUCbsmFrRYPTKmPFf4UC9s/F2omaTihAxXpJr+gxsX0l?=
 =?us-ascii?Q?4DLJLjERMcxDcGYLU9p05zrKg/2y/VnJzOsV1WjOzaZ7wtZe9QHDQ71BDbWq?=
 =?us-ascii?Q?uElZR9CVksdgxGmouPRYJ8cpewrgpSgcQRdIyvvgag2rCTfOistkvtLEosgK?=
 =?us-ascii?Q?tVpEONj93szH+XxQ17LMw6dmE6MxoB6COrewwRycryOzmE8A79+HJyyAElEO?=
 =?us-ascii?Q?SDe0nIB+PNw/SxDfcRs+tVQOIHVuyxtChe27Ld4kUvGeofb45lyuWW2AfJh9?=
 =?us-ascii?Q?e4MeSO5KyVviAjh2t8qML738sYpZUVa3xZoZfY1hK3rVK9uEpe6cjl8Z8xSw?=
 =?us-ascii?Q?fqCKscH1U8dX5e740wfPqRYH61eYEEuU+JXo1QiEuAMWBpM3OnGYnhQqff32?=
 =?us-ascii?Q?FKBLRpETChnVFN0OvQIvaEXsWGHZVBaykZAIj8rgXzkkGgb3VtXU+V09DZEm?=
 =?us-ascii?Q?jyY4/OiywSwaoZEJkcBmFxdQl+Yl5B5YiYPmpJM7z9JV2/qv7mXd/zaZzmUy?=
 =?us-ascii?Q?nSmySkzDmCmO5sJ0q4ZQm4BEA+CRjMSv8C/yMKpKMHbF2zr+4Ug5vlx1H6YK?=
 =?us-ascii?Q?RQL1PVpIEIPChljnC4d9aRkIuT5/orGtt1i0ba6AHfpgzQAcRng+WucgSu2J?=
 =?us-ascii?Q?md/EwOOyDnYVldfJBp47R0jCbOJZb5mTejyHUObIhRY1l3QtU/NR/BU4WBHt?=
 =?us-ascii?Q?tn7oJEzN/1YNwafCi60Nmbtff6FHR9BZySYY+jz2wfIJOHh3zhqbSsLcwk1u?=
 =?us-ascii?Q?enIAehMutd8sjOkpeMHh3HxrGFKsFh6B3QUW/T0sv/DpV0BFqumMuJPS4TIC?=
 =?us-ascii?Q?sS0hqB0yhTejTvNNY/1g5Px/14fmkcvu/NDiE45cgl5vftvB5e874KOiQcFp?=
 =?us-ascii?Q?Mpn0duQ3UhmnPPKguBymm2Kp4HP6AwmOeAiHb/mbgXcvdjWC8CdXT7jUNIBa?=
 =?us-ascii?Q?0beevuwNJvEurXoeXH+OFaDfjneG7TJiBJgrB2VEccKto5DSDSk3ZzhZs0Cp?=
 =?us-ascii?Q?b1FLj84xg50zNClPaSUAHMI897Ng1mQSVxz04xmOHRU6+QRz0mRKRfSAhUHL?=
 =?us-ascii?Q?QQdYUur0WYiN8pSSX70LziJ0K83riltnRe3U5q6t+tGumhtTKx/f2epQCKyx?=
 =?us-ascii?Q?at2RszZcqF/RUJmuiL4XJtU08YLo23MIW7x+SXTlEVkprQxPiiUNKKGQ2y0D?=
 =?us-ascii?Q?PAStPZt4hVQVcXiVdu8csllpUEFCljE5FQ7ewVUsaqiual7oHSgI5pnlfEMm?=
 =?us-ascii?Q?OjMcf05uRTOyqxL6S6Qjd9OF8xLuUhe6jDp0oqOUD8A7fyHEHvoIMhrRSnOX?=
 =?us-ascii?Q?5DKWzRpDhySV8scF4iyMBqEvcQkasmF1P5T0mQw/rJrwUGTIjd1lmnkQpifG?=
 =?us-ascii?Q?grjI109OPlK3xsfSLgkBY/LnxhFDT7gKmWoeyVSuuFoDnXfrzEWJhX9IVdhC?=
 =?us-ascii?Q?aziYnOB1f1+Zo9qG9TH85jMQF91lOOxBRC7HndUb9XJCKzLoVPi1EBusmv07?=
 =?us-ascii?Q?HA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9eeef2-35d7-43a6-e66a-08db979b2ce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 23:08:13.2046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IG15myC+MBvLGArTbwXx65UnY/zV5tU3WnZvzCUiixWpc1hHAYFkgmxf99U7DT4AYUxR1fas7p8FP4o3g/DRYh4EpoeXeAnn3SRAL5B+3ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

>From: Simon Horman <horms@kernel.org>
>Sent: Sunday, August 6, 2023 7:32 PM
>
>On Fri, Aug 04, 2023 at 08:04:51PM +0100, Vadim Fedorenko wrote:
>> From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>
>> Add firmware admin command to access clock generation unit
>> configuration, it is required to enable Extended PTP and SyncE features
>> in the driver.
>> Add definitions of possible hardware variations of input and output pins
>> related to clock generation unit and functions to access the data.
>>
>> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>
>Hi Arkadiusz and Vadim,
>
>> diff --git a/drivers/net/ethernet/intel/ice/ice_common.c
>b/drivers/net/ethernet/intel/ice/ice_common.c
>
>...
>
>> +/**
>> + * ice_aq_get_cgu_dpll_status - get dpll status
>> + * @hw: pointer to the HW struct
>> + * @dpll_num: DPLL index
>> + * @ref_state: Reference clock state
>> + * @config: current DPLL config
>> + * @dpll_state: current DPLL state
>> + * @phase_offset: Phase offset in ns
>> + * @eec_mode: EEC_mode
>> + *
>> + * Get CGU DPLL status (0x0C66)
>> + * Return: 0 on success or negative value on failure.
>> + */
>> +int
>> +ice_aq_get_cgu_dpll_status(struct ice_hw *hw, u8 dpll_num, u8
>>*ref_state,
>> +			   u8 *dpll_state, u8 *config, s64 *phase_offset,
>> +			   u8 *eec_mode)
>> +{
>> +	struct ice_aqc_get_cgu_dpll_status *cmd;
>> +	const s64 NSEC_PER_PSEC =3D 1000LL;
>
>Probably this should be in lower case, or an (upper case) #define.
>In the case of the latter it should probably be moved outside of the
>function.

Hi Simon,

Sure, will fix.

>
>> +	struct ice_aq_desc desc;
>> +	int status;
>> +
>> +	ice_fill_dflt_direct_cmd_desc(&desc,
>>ice_aqc_opc_get_cgu_dpll_status);
>> +	cmd =3D &desc.params.get_cgu_dpll_status;
>> +	cmd->dpll_num =3D dpll_num;
>> +
>> +	status =3D ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
>> +	if (!status) {
>> +		*ref_state =3D cmd->ref_state;
>> +		*dpll_state =3D cmd->dpll_state;
>> +		*config =3D cmd->config;
>> +		*phase_offset =3D le32_to_cpu(cmd->phase_offset_h);
>> +		*phase_offset <<=3D 32;
>> +		*phase_offset +=3D le32_to_cpu(cmd->phase_offset_l);
>> +		*phase_offset =3D sign_extend64(*phase_offset, 47) /
>> +			NSEC_PER_PSEC;
>
>This causes a build failure on x86_32.
>
>  ERROR: modpost: "__divdi3" [drivers/net/ethernet/intel/ice/ice.ko]
>undefined!
>
>Possibly you want (please do check for yourself):
>
>		*phase_offset =3D div64_s64(sign_extend64(*phase_offset, 47),
>					  NSEC_PER_PSEC);
>

Yes, makes sense, thanks for catching this, will fix.

>> +		*eec_mode =3D cmd->eec_mode;
>> +	}
>> +
>> +	return status;
>> +}
>> +
>> +/**
>> + * ice_aq_set_cgu_dpll_config - set dpll config
>> + * @hw: pointer to the HW struct
>> + * @dpll_num: DPLL index
>> + * @ref_state: Reference clock state
>> + * @config: DPLL config
>> + * @eec_mode: EEC mode
>> + *
>> + * Set CGU DPLL config (0x0C67)
>> + * Return: 0 on success or negative value on failure.
>> + */
>> +int
>> +ice_aq_set_cgu_dpll_config(struct ice_hw *hw, u8 dpll_num, u8 ref_state=
,
>> +			   u8 config, u8 eec_mode)
>> +{
>> +	struct ice_aqc_set_cgu_dpll_config *cmd;
>> +	struct ice_aq_desc desc;
>> +
>> +	ice_fill_dflt_direct_cmd_desc(&desc,
>>ice_aqc_opc_set_cgu_dpll_config);
>> +	cmd =3D &desc.params.set_cgu_dpll_config;
>> +	cmd->dpll_num =3D dpll_num;
>> +	cmd->ref_state =3D ref_state;
>> +	cmd->config =3D config;
>> +	cmd->eec_mode =3D eec_mode;
>> +
>> +	return ice_aq_send_cmd(hw, &desc, NULL, 0, NULL);
>> +}
>> +
>> +/**
>> + * ice_aq_set_cgu_ref_prio - set input refernce priority
>
>nit: refernce -> reference
>

Sure, will fix.

Thank you!
Arkadiusz

>> + * @hw: pointer to the HW struct
>> + * @dpll_num: DPLL index
>> + * @ref_idx: Reference pin index
>> + * @ref_priority: Reference input priority
>> + *
>> + * Set CGU reference priority (0x0C68)
>> + * Return: 0 on success or negative value on failure.
>> + */
>
>...
>
>--
>pw-bot: changes-requested

