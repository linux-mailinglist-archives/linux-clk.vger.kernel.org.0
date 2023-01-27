Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7863D67ED23
	for <lists+linux-clk@lfdr.de>; Fri, 27 Jan 2023 19:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235125AbjA0SNw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 27 Jan 2023 13:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234909AbjA0SNp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2023 13:13:45 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E0CCC01;
        Fri, 27 Jan 2023 10:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674843211; x=1706379211;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ybg/6KRWVxq0ghvGHJor02MM12mFmjsumYJ9rMhFeas=;
  b=QgqN7nEE5X/gHG4kUMSmK8ZElyNY91v76JxE4naNaEMwtcSmopJmGXh1
   v81WqgchmrSHqNTJ7Bg5t8Fxm1is6xPKPSnCCAkVO/Sfly4qeq/aevUOu
   cOVN/73r7J6OXeGwgAhRUJCMy9/jj7B03gKZCw72k4u1su/KfDah8rWkj
   wFSxEBgbdqBPMaCjXdMCnoomy3TO+yzL9htA02dHuJLlUHPiQxMcR6vzw
   K52flpSzhvIY2cbfRlBoh0FdCVHyd3mqjuOG6VmDH3cDqLHwO1C5abUDp
   4SkVyqmull5RZU+6RGK/jQP6/4ESK+p85LnmMs0NhB78w0bYArKLmOsJJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="325819442"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; 
   d="scan'208";a="325819442"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 10:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="726767545"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; 
   d="scan'208";a="726767545"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2023 10:13:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 10:13:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 10:13:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 10:13:29 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 10:13:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W975gLt0FAqxC59Du/SirmvQr3xUnpOWVz0mx+23kblhALk9dWcogstuPaybl1v9GE9bHInEnrKXH0qVVV3xiNikG3lYczhF9cDLqRtOzQv8h4/QJi5r5rnwMgEz9MYBtmVCa47ZJdh2cFVaZJt1SzlDVLeEZGeCbU5dNzX4B4yiWUzoTbNntYN0q79AtzHtZoXF8MG+8k4c5nmc+GeLkJyAgLAmRGrAeU0Xj5VcgEmPHL6+XmisTqCmE5vzV5MQyD5u6rMYchVhdLiAb1P1jJS+1i7dxbvgLTQY4gOUF3r6u1GWyep4Gfek/7oh2jjS+8O4os5dZceX6mGiG3Kwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2d0LYsg/FciCdGeNgyMYaVKIof99Yc90sdqVxPFoVU=;
 b=jU+GvNtKySaDFU7aGFIAA5Ey2LG4nEvirNuhSIXW+UKML7nZ4pcrQSwajtnoDpWi7kYEc62oAIQmc+2xET0VYHGONJJzZF5MzKTqf18waILMgc6/Fp3j9QVzlDkJ+PapffAY7vJy7QQNSjOXs6X1/2y9UNaZNg6naSIOBtXzmDSYIDoail2eL8TVfX64C1ZqIAjUqBzCyHlc0fueD9wIVQxh5rdYJrvqA5/lwqDAo7TLyz/zbx1SDjGhK0l4brFC7dYrA4f4R+H2k+VlzMOsZrFIN35hQvtDSjJ46g9errUnjbVBrtIy859lYg7bKUQ/Emrs1BV5n5r/gknkdD9DuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) by
 MN0PR11MB5986.namprd11.prod.outlook.com (2603:10b6:208:371::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 18:13:20 +0000
Received: from DM6PR11MB4657.namprd11.prod.outlook.com
 ([fe80::9c46:2880:3985:6f89]) by DM6PR11MB4657.namprd11.prod.outlook.com
 ([fe80::9c46:2880:3985:6f89%4]) with mapi id 15.20.6043.025; Fri, 27 Jan 2023
 18:13:20 +0000
From:   "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
To:     Jiri Pirko <jiri@resnulli.us>, Vadim Fedorenko <vadfed@meta.com>
CC:     Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: RE: [RFC PATCH v5 4/4] ice: implement dpll interface to control cgu
Thread-Topic: [RFC PATCH v5 4/4] ice: implement dpll interface to control cgu
Thread-Index: AQHZKp3NB3+z9/Hbn06pYsw7Q84CVK6l1pCAgAzKLSA=
Date:   Fri, 27 Jan 2023 18:13:20 +0000
Message-ID: <DM6PR11MB46570EA36A31F636BFA14EC19BCC9@DM6PR11MB4657.namprd11.prod.outlook.com>
References: <20230117180051.2983639-1-vadfed@meta.com>
 <20230117180051.2983639-5-vadfed@meta.com> <Y8lZl+U0Bll4BAKE@nanopsycho>
In-Reply-To: <Y8lZl+U0Bll4BAKE@nanopsycho>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4657:EE_|MN0PR11MB5986:EE_
x-ms-office365-filtering-correlation-id: 3da3a17e-27e1-4955-2e4d-08db00922bf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6XnE0YmkK2aGmSUqBlhSj+S29IZ9cXeOHSpinr19I2iiDpWe9LTVVtwMCWFzzI1Epp1VCEP+AL8hGC1pbvzT1IVA/PJX1moSvv8LfBI6mkOi0qqi+bS+pAMgMF8Hs5lZB9zwavnzaoeYHysuiGmJa/fxCwNMfIy2DFyuBBs7cR+3176fuGIPr5/5IN2HqIe3suZt8ewHSul88aEOlFBIqPyNBaxz6fY7vgshkmgn8SgeufkFPTW+3WTJXUiNX71uUWn4HtB/EJqm28qWXos75pqQg4gbXXr9EDFRol8JKgnxsVxMYBMUcDTMcju23h+rch7/POorcS4XJuiptJ/IgAPujem1m3TZ53E0WoYYWRe7bX9DAtMyNH2rqh5l9XpMSzr5d7mKvkaGUA+Qf8iynh1aSf3QLly6P8rURKg0eT2Pmsw0Cqbuj1wx6FN4c6yMHL4RceumhREvwjJMhRhKaVU5seKD6sdGn3zQyTh6aYSgxW2q6ZhrjhQq9xBT23px+2mHZvhXg6QJWGOO1ccKrnkV+yebT6PNmW3GgR4Cqpw6YUhNy3/4yCfoMRZlByraAli8x7B2uKF5yuU0L3HwS8uMZez5qDEa19ijEcBnvyxG7h+aWaz+ZsBaPUy9lhNf9W/eojEVjF0Dc3S/xuhoo0qM2dFbU5mo8VH0IvnlveRwNiAGOuMtUrDhzLZcDKO8MlOQGSwC18qy+wFF3uqflg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199018)(8676002)(71200400001)(33656002)(7696005)(54906003)(55016003)(38100700002)(122000001)(9686003)(38070700005)(110136005)(26005)(83380400001)(86362001)(186003)(30864003)(478600001)(107886003)(6506007)(82960400001)(316002)(52536014)(64756008)(8936002)(66446008)(66476007)(66556008)(5660300002)(4326008)(2906002)(76116006)(66946007)(41300700001)(559001)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9RG7+5xi7zLj5dwBpCx+nMbsdJ+XNblEV8JTb+0YEXjwDDrTMdhdyQNjZUsA?=
 =?us-ascii?Q?rKFHcSVCO43Xaemi2XNMp2PPf7mSNRc9FmAf1iFWI6dKsvpDofPODWZ5qnYe?=
 =?us-ascii?Q?hgTPBQPBExBZU9uiV65A/0hFEVp/ycBwoe/Xh2bZZ5TTkjoxeqPP6Cs840ey?=
 =?us-ascii?Q?q1h3nK74AN0jVMbkqFPOuKO+4k8Czp70DhNYj5FrSbUeWv0SJE+c7ohk+2ma?=
 =?us-ascii?Q?L7WzLmcW3Nh9XqjHDaqnkCVH8e9IybmWkx+57lRcKigBr6xu8DwfmOw4/tJA?=
 =?us-ascii?Q?Rntf7DrtcGPKA21LC5gYNsne/gYpbycKLhqTQOaQupdvYZLB7gjj/hdO9sFH?=
 =?us-ascii?Q?uUoExrlezQRxWO3ahIFnU9DpejjrbU3yn7eAfs9McQTMN5PNtWAmd9gZtfFK?=
 =?us-ascii?Q?CauEfq1H8fpThB5Hvxf59Zv7snSAEskGkeiQmEQDqz4PReWaSS1pqlfrc5wp?=
 =?us-ascii?Q?D2MZqb9HXd9OeAfNzbYcn2esOinV2ndxvPd6rWL7jg+6hEDX6bJPjE96yRtb?=
 =?us-ascii?Q?mL5bbnS/nOAacZ/xdJBdrFNJTaR+R62zvyehhq5jQ9gG6jlBj6Rrymgs3aLT?=
 =?us-ascii?Q?5QJRMBEX9yU/mFwTGRA/rHMhlc3KqFx+UnwE7795ZxRTvc+EFB8ken6X6G1d?=
 =?us-ascii?Q?Dh6y5rGU7XHNVUrcwShRJz9mQ3rPDjWpbLSByPmz1kewrpy/mS1r2RYvbCzV?=
 =?us-ascii?Q?15KTlc9XRQfzoVeo+hDI/fV2CCdxNmLliKV2Pg9RsL8WzcEvVvJU+AzhH63+?=
 =?us-ascii?Q?HUpl7nAb4GfjWfx81UBctj+wwb03VjAS0ZAacV8e8lnuF6lGlaGK4XOHuDGG?=
 =?us-ascii?Q?6OxCUrgreqCc/RN56Z8w8I46W21oNFVKVzPPQ2+w1W57B+p6sERA3XrmmWWT?=
 =?us-ascii?Q?XiHuwPUdGFe/rFrQNxsNB5eIKvXLwDUo6dZfiTxGmPfKYopUYS0tv/X1Abeu?=
 =?us-ascii?Q?CSOytPUg0oZPSyNTyjZqLAQ9CwCOikmdNzvRKshLWLrs08B2J7pKqMim9fD2?=
 =?us-ascii?Q?ytbQ+Zsq927AuThCHeGTDydYiKp8b3FHBjSooRsuKs/rkdJP702O3g/ghk5U?=
 =?us-ascii?Q?Tv8AqjFkDEME3+rnkuwDKU0j8ba/bcWw1dJAYHHbqjTQII2A+E+6omw3dVtw?=
 =?us-ascii?Q?ad6ydXjYJ0HrG3Jmd79hXfOheSebK7q2ESOx5RrmGMU3zAOYoy7XB2isYbDO?=
 =?us-ascii?Q?VVUMg0IX8dkPtRriRbTOO1ZrY51z3ZO8zHi0I9UM0dwp5VRwiiKUrDgbg/3z?=
 =?us-ascii?Q?oKIwSECDdJW7jqkCRcA5jsi23o5STUTQknxOQvTClD9/7vtIh0REFwjgzEkA?=
 =?us-ascii?Q?0F46Qpit0zGLx6WJzyHUqtoCPWT4ZeTlKP1fz0a5BhPSwJEhqZyo0nI7jzdH?=
 =?us-ascii?Q?Jme3kbKhgoVCvU/5RhWFVyrMli8EesSYpRQ90QLYgRkpiuTWvd1RVky1JGlp?=
 =?us-ascii?Q?PH1YKuglTecgqjVF40faqqawaoRYWVN6gsH0PJGiq60ou/QADXFrpUWiE7nA?=
 =?us-ascii?Q?uW5QL6QFLLHNXsmpo+uiKNLQSJeC/IS+l34OzWrzCaXNioPTViZ4bnIbsIj8?=
 =?us-ascii?Q?uluJj1jTt+R4MWgLlaCsGyerJPXbcfLgoneqyKt4ywYIOfot5rBJ1Nv8Kvbr?=
 =?us-ascii?Q?RQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da3a17e-27e1-4955-2e4d-08db00922bf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2023 18:13:20.5548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GWmZ2wz4oRVrDeSK/j0EepxrQ7tQXyW9DW63/UVjSHvMYez5W9c+jagZ/ygQIqwHiPXXMmBFaeHVKpkoHr6b90FWb99kHsP1DchLgLv5UA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5986
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


>From: Jiri Pirko <jiri@resnulli.us>
>Sent: Thursday, January 19, 2023 3:54 PM
>
>Tue, Jan 17, 2023 at 07:00:51PM CET, vadfed@meta.com wrote:
>>From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>
>>Control over clock generation unit is required for further development
>>of Synchronous Ethernet feature. Interface provides ability to obtain
>>current state of a dpll, its sources and outputs which are pins, and
>>allows their configuration.
>>
>>Co-developed-by: Milena Olech <milena.olech@intel.com>
>>Signed-off-by: Milena Olech <milena.olech@intel.com>
>>Co-developed-by: Michal Michalik <michal.michalik@intel.com>
>>Signed-off-by: Michal Michalik <michal.michalik@intel.com>
>>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>Signed-off-by: Vadim Fedorenko <vadfed@meta.com>
>>---
>> drivers/net/ethernet/intel/Kconfig        |    1 +
>> drivers/net/ethernet/intel/ice/Makefile   |    3 +-
>> drivers/net/ethernet/intel/ice/ice.h      |    4 +
>> drivers/net/ethernet/intel/ice/ice_dpll.c | 2115 +++++++++++++++++++++
>> drivers/net/ethernet/intel/ice/ice_dpll.h |   99 +
>> drivers/net/ethernet/intel/ice/ice_main.c |   10 +
>> 6 files changed, 2231 insertions(+), 1 deletion(-)
>> create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.c
>> create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.h
>>
>>diff --git a/drivers/net/ethernet/intel/Kconfig
>>b/drivers/net/ethernet/intel/Kconfig
>>index 3facb55b7161..dcf0e12991bf 100644
>>--- a/drivers/net/ethernet/intel/Kconfig
>>+++ b/drivers/net/ethernet/intel/Kconfig
>>@@ -300,6 +300,7 @@ config ICE
>> 	select DIMLIB
>> 	select NET_DEVLINK
>> 	select PLDMFW
>>+	select DPLL
>> 	help
>> 	  This driver supports Intel(R) Ethernet Connection E800 Series of
>> 	  devices.  For more information on how to identify your adapter, go
>>diff --git a/drivers/net/ethernet/intel/ice/Makefile
>>b/drivers/net/ethernet/intel/ice/Makefile
>>index 9183d480b70b..ebfd456f76cd 100644
>>--- a/drivers/net/ethernet/intel/ice/Makefile
>>+++ b/drivers/net/ethernet/intel/ice/Makefile
>>@@ -32,7 +32,8 @@ ice-y :=3D ice_main.o	\
>> 	 ice_lag.o	\
>> 	 ice_ethtool.o  \
>> 	 ice_repr.o	\
>>-	 ice_tc_lib.o
>>+	 ice_tc_lib.o	\
>>+	 ice_dpll.o
>> ice-$(CONFIG_PCI_IOV) +=3D	\
>> 	ice_sriov.o		\
>> 	ice_virtchnl.o		\
>>diff --git a/drivers/net/ethernet/intel/ice/ice.h
>>b/drivers/net/ethernet/intel/ice/ice.h
>>index 3368dba42789..efc1844ef77c 100644
>>--- a/drivers/net/ethernet/intel/ice/ice.h
>>+++ b/drivers/net/ethernet/intel/ice/ice.h
>>@@ -73,6 +73,7 @@
>> #include "ice_lag.h"
>> #include "ice_vsi_vlan_ops.h"
>> #include "ice_gnss.h"
>>+#include "ice_dpll.h"
>>
>> #define ICE_BAR0		0
>> #define ICE_REQ_DESC_MULTIPLE	32
>>@@ -198,6 +199,7 @@
>> enum ice_feature {
>> 	ICE_F_DSCP,
>> 	ICE_F_PTP_EXTTS,
>>+	ICE_F_PHY_RCLK,
>> 	ICE_F_SMA_CTRL,
>> 	ICE_F_CGU,
>> 	ICE_F_GNSS,
>>@@ -509,6 +511,7 @@ enum ice_pf_flags {
>> 	ICE_FLAG_PLUG_AUX_DEV,
>> 	ICE_FLAG_MTU_CHANGED,
>> 	ICE_FLAG_GNSS,			/* GNSS successfully initialized */
>>+	ICE_FLAG_DPLL,			/* SyncE/PTP dplls initialized */
>> 	ICE_PF_FLAGS_NBITS		/* must be last */
>> };
>>
>>@@ -633,6 +636,7 @@ struct ice_pf {
>> #define ICE_VF_AGG_NODE_ID_START	65
>> #define ICE_MAX_VF_AGG_NODES		32
>> 	struct ice_agg_node vf_agg_node[ICE_MAX_VF_AGG_NODES];
>>+	struct ice_dplls dplls;
>> };
>>
>> struct ice_netdev_priv {
>>diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c
>>b/drivers/net/ethernet/intel/ice/ice_dpll.c
>>new file mode 100644
>>index 000000000000..6ed1fcee4e03
>>--- /dev/null
>>+++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
>>@@ -0,0 +1,2115 @@
>>+// SPDX-License-Identifier: GPL-2.0
>>+/* Copyright (C) 2022, Intel Corporation. */
>>+
>>+#include "ice.h"
>>+#include "ice_lib.h"
>>+#include "ice_trace.h"
>>+#include <linux/dpll.h>
>>+#include <uapi/linux/dpll.h>
>
>Don't include uapi header directly. Inlude of linux/dpll.h is enough.
>

True, will fix.

>
>>+
>>+#define CGU_STATE_ACQ_ERR_THRESHOLD	50
>>+#define ICE_DPLL_FREQ_1_HZ		1
>>+#define ICE_DPLL_FREQ_10_MHZ		10000000
>>+
>>+/**
>>+ * dpll_lock_status - map ice cgu states into dpll's subsystem lock
>>status
>>+ */
>>+static const enum dpll_lock_status
>>+ice_dpll_status[__DPLL_LOCK_STATUS_MAX] =3D {
>
>Don't use __ define.
>

Sure, will fix.

>
>>+	[ICE_CGU_STATE_INVALID] =3D DPLL_LOCK_STATUS_UNSPEC,
>>+	[ICE_CGU_STATE_FREERUN] =3D DPLL_LOCK_STATUS_UNLOCKED,
>>+	[ICE_CGU_STATE_LOCKED] =3D DPLL_LOCK_STATUS_CALIBRATING,
>>+	[ICE_CGU_STATE_LOCKED_HO_ACQ] =3D DPLL_LOCK_STATUS_LOCKED,
>>+	[ICE_CGU_STATE_HOLDOVER] =3D DPLL_LOCK_STATUS_HOLDOVER,
>>+};
>>+
>>+/**
>>+ * ice_dpll_pin_type - enumerate ince pin types
>>+ */
>>+enum ice_dpll_pin_type {
>>+	ICE_DPLL_PIN_INVALID =3D 0,
>>+	ICE_DPLL_PIN_TYPE_SOURCE,
>>+	ICE_DPLL_PIN_TYPE_OUTPUT,
>>+	ICE_DPLL_PIN_TYPE_RCLK_SOURCE,
>>+};
>>+
>>+/**
>>+ * pin_type_name - string names of ice pin types
>>+ */
>>+static const char * const pin_type_name[] =3D {
>>+	[ICE_DPLL_PIN_TYPE_SOURCE] =3D "source",
>>+	[ICE_DPLL_PIN_TYPE_OUTPUT] =3D "output",
>>+	[ICE_DPLL_PIN_TYPE_RCLK_SOURCE] =3D "rclk-source",
>>+};
>>+
>>+/**
>>+ * ice_dpll_pin_signal_type_to_freq - translate pin_signal_type to freq
>>value
>>+ * @sig_type: signal type to find frequency
>>+ * @freq: on success - frequency of a signal type
>>+ *
>>+ * Return:
>>+ * * 0 - frequency valid
>>+ * * negative - error
>>+ */
>>+static inline int
>>+ice_dpll_pin_signal_type_to_freq(const enum dpll_pin_signal_type
>>sig_type,
>>+				 u32 *freq)
>>+{
>>+	if (sig_type =3D=3D DPLL_PIN_SIGNAL_TYPE_UNSPEC)
>>+		return -EINVAL;
>>+	else if (sig_type =3D=3D DPLL_PIN_SIGNAL_TYPE_1_PPS)
>>+		*freq =3D ICE_DPLL_FREQ_1_HZ;
>>+	else if (sig_type =3D=3D DPLL_PIN_SIGNAL_TYPE_10_MHZ)
>>+		*freq =3D ICE_DPLL_FREQ_10_MHZ;
>>+	else
>>+		return -EINVAL;
>>+
>>+	return 0;
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_freq_to_signal_type - translate pin freq to signal type
>>+ * @freq: frequency to translate
>>+ *
>>+ * Return: signal type of a pin based on frequency.
>>+ */
>>+static inline enum dpll_pin_signal_type
>>+ice_dpll_pin_freq_to_signal_type(u32 freq)
>>+{
>>+	if (freq =3D=3D ICE_DPLL_FREQ_1_HZ)
>>+		return DPLL_PIN_SIGNAL_TYPE_1_PPS;
>>+	else if (freq =3D=3D ICE_DPLL_FREQ_10_MHZ)
>>+		return DPLL_PIN_SIGNAL_TYPE_10_MHZ;
>>+	else
>>+		return DPLL_PIN_SIGNAL_TYPE_CUSTOM_FREQ;
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_signal_type_set - set pin's signal type in hardware
>>+ * @pf: Board private structure
>>+ * @pin: pointer to a pin
>>+ * @pin_type: type of pin being configured
>>+ * @sig_type: signal type to be set
>>+ *
>>+ * Translate pin signal type to frequency and set it on a pin.
>>+ *
>>+ * Return:
>>+ * * 0 - OK or no change required
>>+ * * negative - error
>>+ */
>>+static int
>>+__ice_dpll_pin_signal_type_set(struct ice_pf *pf, struct ice_dpll_pin
>>*pin,
>>+			       const enum ice_dpll_pin_type pin_type,
>>+			       const enum dpll_pin_signal_type sig_type)
>>+{
>>+	u8 flags;
>>+	u32 freq;
>>+	int ret;
>>+
>>+	ret =3D ice_dpll_pin_signal_type_to_freq(sig_type, &freq);
>>+	if (ret)
>>+		return ret;
>>+
>>+	if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_SOURCE) {
>>+		flags =3D ICE_AQC_SET_CGU_IN_CFG_FLG1_UPDATE_FREQ;
>>+		ret =3D ice_aq_set_input_pin_cfg(&pf->hw, pin->idx, flags,
>>+					       pin->flags, freq, 0);
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_OUTPUT) {
>>+		flags =3D pin->flags | ICE_AQC_SET_CGU_OUT_CFG_UPDATE_FREQ;
>>+		ret =3D ice_aq_set_output_pin_cfg(&pf->hw, pin->idx, flags,
>>+						0, freq, 0);
>>+	} else {
>>+		ret =3D -EINVAL;
>>+	}
>>+
>>+	if (ret) {
>>+		dev_dbg(ice_pf_to_dev(pf),
>>+			"err:%d %s failed to set pin freq:%u on pin:%u\n",
>>+			ret, ice_aq_str(pf->hw.adminq.sq_last_status),
>>+			freq, pin->idx);
>>+	} else {
>>+		pin->signal_type =3D sig_type;
>>+		pin->freq =3D freq;
>>+	}
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_enable - enable a pin on dplls
>>+ * @hw: board private hw structure
>>+ * @pin: pointer to a pin
>>+ * @pin_type: type of pin being enabled
>>+ *
>>+ * Enable a pin on both dplls. Store current state in pin->flags.
>>+ *
>>+ * Return:
>>+ * * 0 - OK
>>+ * * negative - error
>>+ */
>>+static int
>>+ice_dpll_pin_enable(struct ice_hw *hw, struct ice_dpll_pin *pin,
>>+		    const enum ice_dpll_pin_type pin_type)
>>+{
>>+	u8 flags =3D pin->flags;
>>+	int ret;
>>+
>>+	if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_SOURCE) {
>>+		flags |=3D ICE_AQC_GET_CGU_IN_CFG_FLG2_INPUT_EN;
>>+		ret =3D ice_aq_set_input_pin_cfg(hw, pin->idx, 0, flags, 0, 0);
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_OUTPUT) {
>>+		flags |=3D ICE_AQC_SET_CGU_OUT_CFG_OUT_EN;
>>+		ret =3D ice_aq_set_output_pin_cfg(hw, pin->idx, flags, 0, 0, 0);
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_RCLK_SOURCE) {
>>+		flags |=3D ICE_DPLL_RCLK_SOURCE_FLAG_EN;
>>+		ret =3D 0;
>>+	}
>>+	if (ret)
>>+		dev_dbg(ice_pf_to_dev((struct ice_pf *)(hw->back)),
>>+			"err:%d %s failed to enable %s pin:%u\n",
>>+			ret, ice_aq_str(hw->adminq.sq_last_status),
>>+			pin_type_name[pin_type], pin->idx);
>>+	else
>>+		pin->flags =3D flags;
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_disable - disable a pin on dplls
>>+ * @hw: board private hw structure
>>+ * @pin: pointer to a pin
>>+ * @pin_type: type of pin being disabled
>>+ *
>>+ * Disable a pin on both dplls. Store current state in pin->flags.
>>+ *
>>+ * Return:
>>+ * * 0 - OK
>>+ * * negative - error
>>+ */
>>+static int
>>+ice_dpll_pin_disable(struct ice_hw *hw, struct ice_dpll_pin *pin,
>>+		     enum ice_dpll_pin_type pin_type)
>>+{
>>+	u8 flags =3D pin->flags;
>>+	int ret;
>>+
>>+	if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_SOURCE) {
>>+		flags &=3D ~(ICE_AQC_GET_CGU_IN_CFG_FLG2_INPUT_EN);
>>+		ret =3D ice_aq_set_input_pin_cfg(hw, pin->idx, 0, flags, 0, 0);
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_OUTPUT) {
>>+		flags &=3D ~(ICE_AQC_SET_CGU_OUT_CFG_OUT_EN);
>>+		ret =3D ice_aq_set_output_pin_cfg(hw, pin->idx, flags, 0, 0, 0);
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_RCLK_SOURCE) {
>>+		flags &=3D ~(ICE_DPLL_RCLK_SOURCE_FLAG_EN);
>>+		ret =3D ice_aq_set_phy_rec_clk_out(hw, pin->idx, false,
>>+						 &pin->freq);
>>+	}
>>+
>>+	if (ret)
>>+		dev_dbg(ice_pf_to_dev((struct ice_pf *)(hw->back)),
>>+			"err:%d %s failed to disable %s pin:%u\n",
>>+			ret, ice_aq_str(hw->adminq.sq_last_status),
>>+			pin_type_name[pin_type], pin->idx);
>>+	else
>>+		pin->flags =3D flags;
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_update - update pin's mode
>>+ * @hw: private board struct
>>+ * @pin: structure with pin attributes to be updated
>>+ * @pin_type: type of pin being updated
>>+ *
>>+ * Determine pin current mode, frequency and signal type. Then update
>>struct
>>+ * holding the pin info.
>>+ *
>>+ * Return:
>>+ * * 0 - OK
>>+ * * negative - error
>>+ */
>>+int
>>+ice_dpll_pin_update(struct ice_hw *hw, struct ice_dpll_pin *pin,
>>+		    const enum ice_dpll_pin_type pin_type)
>>+{
>>+	int ret;
>>+
>>+	pin->mode_mask =3D 0;
>>+	if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_SOURCE) {
>>+		ret =3D ice_aq_get_input_pin_cfg(hw, pin->idx, NULL, NULL, NULL,
>>+					       &pin->flags, &pin->freq, NULL);
>>+		set_bit(DPLL_PIN_MODE_SOURCE, &pin->mode_mask);
>>+		if (ICE_AQC_GET_CGU_IN_CFG_FLG2_INPUT_EN & pin->flags)
>>+			set_bit(DPLL_PIN_MODE_CONNECTED, &pin->mode_mask);
>>+		else
>>+			set_bit(DPLL_PIN_MODE_DISCONNECTED, &pin->mode_mask);
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_OUTPUT) {
>>+		ret =3D ice_aq_get_output_pin_cfg(hw, pin->idx, &pin->flags,
>>+						NULL, &pin->freq, NULL);
>>+		set_bit(DPLL_PIN_MODE_OUTPUT, &pin->mode_mask);
>>+		if (ICE_AQC_SET_CGU_OUT_CFG_OUT_EN & pin->flags)
>>+			set_bit(DPLL_PIN_MODE_CONNECTED, &pin->mode_mask);
>>+		else
>>+			set_bit(DPLL_PIN_MODE_DISCONNECTED, &pin->mode_mask);
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_RCLK_SOURCE) {
>>+		set_bit(DPLL_PIN_MODE_SOURCE, &pin->mode_mask);
>>+		if (ICE_DPLL_RCLK_SOURCE_FLAG_EN & pin->flags)
>>+			set_bit(DPLL_PIN_MODE_CONNECTED, &pin->mode_mask);
>>+		else
>>+			set_bit(DPLL_PIN_MODE_DISCONNECTED, &pin->mode_mask);
>>+		ret =3D 0;
>>+	}
>>+	pin->signal_type =3D ice_dpll_pin_freq_to_signal_type(pin->freq);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_mode_set - set pin's mode
>>+ * @pf: Board private structure
>>+ * @pin: pointer to a pin
>>+ * @pin_type: type of modified pin
>>+ * @mode: requested mode
>>+ *
>>+ * Determine requested pin mode set it on a pin.
>>+ *
>>+ * Return:
>>+ * * 0 - OK or no change required
>>+ * * negative - error
>>+ */
>>+static int
>>+ice_dpll_pin_mode_set(struct ice_pf *pf, struct ice_dpll_pin *pin,
>>+		      const enum ice_dpll_pin_type pin_type,
>>+		      const enum dpll_pin_mode mode)
>>+{
>>+	int ret;
>>+
>>+	if (!test_bit(mode, &pin->mode_supported_mask))
>>+		return -EINVAL;
>>+
>>+	if (test_bit(mode, &pin->mode_mask))
>>+		return 0;
>>+
>>+	if (mode =3D=3D DPLL_PIN_MODE_CONNECTED)
>>+		ret =3D ice_dpll_pin_enable(&pf->hw, pin, pin_type);
>>+	else if (mode =3D=3D DPLL_PIN_MODE_DISCONNECTED)
>>+		ret =3D ice_dpll_pin_disable(&pf->hw, pin, pin_type);
>>+	else
>>+		ret =3D -EINVAL;
>>+
>>+	if (!ret)
>>+		ret =3D ice_dpll_pin_update(&pf->hw, pin, pin_type);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_find_dpll - find ice_dpll on a pf
>>+ * @pf: private board structure
>>+ * @dpll: kernel's dpll_device pointer to be searched
>>+ *
>>+ * Return:
>>+ * * pointer if ice_dpll with given device dpll pointer is found
>>+ * * NULL if not found
>>+ */
>>+static struct ice_dpll
>>+*ice_find_dpll(struct ice_pf *pf, const struct dpll_device *dpll)
>>+{
>>+	if (!pf || !dpll)
>>+		return NULL;
>>+
>>+	return (dpll =3D=3D pf->dplls.eec.dpll ? &pf->dplls.eec :
>>+		dpll =3D=3D pf->dplls.pps.dpll ? &pf->dplls.pps : NULL);
>
>Return is not a function, don't use ()'s here.

Sure, will fix.

>
>
>>+}
>>+
>>+/**
>>+ * ice_find_pin - find ice_dpll_pin on a pf
>>+ * @pf: private board structure
>>+ * @pin: kernel's dpll_pin pointer to be searched for
>>+ * @pin_type: type of pins to be searched for
>>+ *
>>+ * Find and return internal ice pin info pointer holding data of given
>>dpll subsystem
>>+ * pin pointer.
>>+ *
>>+ * Return:
>>+ * * valid 'struct ice_dpll_pin'-type pointer - if given 'pin' pointer
>>was
>>+ * found in pf internal pin data.
>>+ * * NULL - if pin was not found.
>>+ */
>>+static struct ice_dpll_pin
>>+*ice_find_pin(struct ice_pf *pf, const struct dpll_pin *pin,
>>+	      enum ice_dpll_pin_type pin_type)
>>+
>>+{
>>+	struct ice_dpll_pin *pins;
>>+	int pin_num, i;
>>+
>>+	if (!pin || !pf)
>>+		return NULL;
>>+
>>+	if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_SOURCE) {
>>+		pins =3D pf->dplls.inputs;
>>+		pin_num =3D pf->dplls.num_inputs;
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_OUTPUT) {
>>+		pins =3D pf->dplls.outputs;
>>+		pin_num =3D pf->dplls.num_outputs;
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_RCLK_SOURCE) {
>>+		pins =3D pf->dplls.rclk;
>>+		pin_num =3D pf->dplls.num_rclk;
>>+	} else {
>>+		return NULL;
>>+	}
>>+
>>+	for (i =3D 0; i < pin_num; i++)
>>+		if (pin =3D=3D pins[i].pin)
>>+			return &pins[i];
>>+
>>+	return NULL;
>>+}
>>+
>>+/**
>>+ * ice_dpll_hw_source_prio_set - set source priority value in hardware
>>+ * @pf: board private structure
>>+ * @dpll: ice dpll pointer
>>+ * @pin: ice pin pointer
>>+ * @prio: priority value being set on a dpll
>>+ *
>>+ * Internal wrapper for setting the priority in the hardware.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int
>>+ice_dpll_hw_source_prio_set(struct ice_pf *pf, struct ice_dpll *dpll,
>>+			    struct ice_dpll_pin *pin, const u32 prio)
>>+{
>>+	int ret;
>>+
>>+	ret =3D ice_aq_set_cgu_ref_prio(&pf->hw, dpll->dpll_idx, pin->idx,
>>+				      (u8)prio);
>>+	if (ret)
>>+		dev_dbg(ice_pf_to_dev(pf),
>>+			"err:%d %s failed to set pin prio:%u on pin:%u\n",
>>+			ret, ice_aq_str(pf->hw.adminq.sq_last_status),
>>+			prio, pin->idx);
>>+	else
>>+		dpll->input_prio[pin->idx] =3D prio;
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_lock_status_get - get dpll lock status callback
>>+ * @dpll: registered dpll pointer
>>+ * @status: on success holds dpll's lock status
>>+ *
>>+ * Dpll subsystem callback, provides dpll's lock status.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int ice_dpll_lock_status_get(const struct dpll_device *dpll,
>>+				    enum dpll_lock_status *status)
>>+{
>>+	struct ice_pf *pf =3D dpll_priv(dpll);
>>+	struct ice_dpll *d;
>>+
>>+	d =3D ice_find_dpll(pf, dpll);
>>+	if (!d)
>>+		return -EFAULT;
>>+	dev_dbg(ice_pf_to_dev(pf), "%s: dpll:%p, pf:%p\n", __func__, dpll,
>>pf);
>>+	mutex_lock(&pf->dplls.lock);
>>+	*status =3D ice_dpll_status[d->dpll_state];
>>+	mutex_unlock(&pf->dplls.lock);
>>+
>>+	return 0;
>>+}
>>+
>>+/**
>>+ * ice_dpll_source_idx_get - get dpll's source index
>>+ * @dpll: registered dpll pointer
>>+ * @pin_idx: on success holds currently selected source pin index
>>+ *
>>+ * Dpll subsystem callback. Provides index of a source dpll is trying to
>>lock
>>+ * with.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int ice_dpll_source_idx_get(const struct dpll_device *dpll, u32
>>*pin_idx)
>
>Should return struct dpll_pin *. That should be the consitent driver api
>handle for pin.
>

Sure, can fix this way.

>
>>+{
>>+	struct ice_pf *pf =3D dpll_priv(dpll);
>>+	struct ice_dpll *d;
>>+	int ret =3D 0;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	d =3D ice_find_dpll(pf, dpll);
>>+	if (!d) {
>>+		ret =3D -EFAULT;
>>+		goto unlock;
>>+	}
>>+	*pin_idx =3D (u32)d->source_idx;
>>+unlock:
>>+	mutex_unlock(&pf->dplls.lock);
>>+	dev_dbg(ice_pf_to_dev(pf), "%s: dpll:%p, pf:%p d:%p, idx:%u\n",
>>+		__func__, dpll, pf, d, *pin_idx);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_mode_get - get dpll's working mode
>>+ * @dpll: registered dpll pointer
>>+ * @mode: on success holds current working mode of dpll
>>+ *
>>+ * Dpll subsystem callback. Provides working mode of dpll.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int ice_dpll_mode_get(const struct dpll_device *dpll,
>>+			     enum dpll_mode *mode)
>>+{
>>+	struct ice_pf *pf =3D dpll_priv(dpll);
>>+	struct ice_dpll *d;
>>+	int ret =3D 0;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	d =3D ice_find_dpll(pf, dpll);
>>+	if (!d)
>>+		ret =3D -EFAULT;
>>+	else
>>+		*mode =3D DPLL_MODE_AUTOMATIC;
>>+	mutex_unlock(&pf->dplls.lock);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_mode_get - check if dpll's working mode is supported
>>+ * @dpll: registered dpll pointer
>>+ * @mode: mode to be checked for support
>>+ *
>>+ * Dpll subsystem callback. Provides information if working mode is
>>supported
>>+ * by dpll.
>>+ *
>>+ * Return:
>>+ * * true - mode is supported
>>+ * * false - mode is not supported
>>+ */
>>+static bool ice_dpll_mode_supported(const struct dpll_device *dpll,
>>+				    const enum dpll_mode mode)
>>+{
>>+	struct ice_pf *pf =3D dpll_priv(dpll);
>>+	struct ice_dpll *d;
>>+	bool ret =3D true;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	d =3D ice_find_dpll(pf, dpll);
>>+	if (!d)
>>+		ret =3D false;
>>+	else
>>+		if (mode !=3D DPLL_MODE_AUTOMATIC)
>
>"else if" on a single line.

Sure, will fix.

>
>
>>+			ret =3D false;
>>+	mutex_unlock(&pf->dplls.lock);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_signal_type_supported - if pin signal type is supported
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @sig_type: signal type being checked for support
>>+ * @pin_type: type of a pin being checked
>>+ *
>>+ * Check is signal type is supported on given pin/dpll pair.
>>+ *
>>+ * Return:
>>+ * * true - supported
>>+ * * false - not supported
>>+ */
>>+static bool
>>+ice_dpll_pin_signal_type_supported(const struct dpll_device *dpll,
>>+				   const struct dpll_pin *pin,
>>+				   const enum dpll_pin_signal_type sig_type,
>>+				   const enum ice_dpll_pin_type pin_type)
>>+{
>>+	struct ice_pf *pf =3D dpll_pin_priv(dpll, pin);
>>+	struct ice_dpll_pin *p;
>>+	bool supported =3D false;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	p =3D ice_find_pin(pf, pin, pin_type);
>>+	if (p) {
>>+		if (test_bit(sig_type, &p->signal_type_mask))
>
>Loose the nested if.

Sure, will fix.

>
>
>>+			supported =3D true;
>>+	}
>>+	mutex_unlock(&pf->dplls.lock);
>>+
>>+	return supported;
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_signal_type_supported - if rclk source signal type is
>>supported
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @sig_type: signal type being checked for support
>>+ *
>>+ * Dpll subsystem callback. Check is signal type is supported on given
>>pin/dpll
>>+ * pair.
>>+ *
>>+ * Return:
>>+ * * true - supported
>>+ * * false - not supported
>>+ */
>>+static bool
>>+ice_dpll_rclk_signal_type_supported(const struct dpll_device *dpll,
>>+				    const struct dpll_pin *pin,
>>+				    const enum dpll_pin_signal_type sig_type)
>>+{
>>+	const enum ice_dpll_pin_type t =3D ICE_DPLL_PIN_TYPE_RCLK_SOURCE;
>>+
>>+	return ice_dpll_pin_signal_type_supported(dpll, pin, sig_type, t);
>>+}
>>+
>>+/**
>>+ * ice_dpll_source_signal_type_supported - if source signal type is
>>supported
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @sig_type: signal type being checked for support
>>+ *
>>+ * Dpll subsystem callback. Check is signal type is supported on given
>>pin/dpll
>>+ * pair.
>>+ *
>>+ * Return:
>>+ * * true - supported
>>+ * * false - not supported
>>+ */
>>+static bool
>>+ice_dpll_source_signal_type_supported(const struct dpll_device *dpll,
>>+				      const struct dpll_pin *pin,
>>+				      const enum dpll_pin_signal_type sig_type)
>>+{
>>+	return ice_dpll_pin_signal_type_supported(dpll, pin, sig_type,
>>+						  ICE_DPLL_PIN_TYPE_SOURCE);
>>+}
>>+
>>+/**
>>+ * ice_dpll_output_signal_type_supported - if output pin signal type is
>>supported
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @sig_type: signal type being checked
>>+ *
>>+ * Dpll subsystem callback. Check if signal type is supported on given
>>in/dpll
>>+ * pair.
>>+ *
>>+ * Return:
>>+ * * true - supported
>>+ * * false - not supported
>>+ */
>>+static bool
>>+ice_dpll_output_signal_type_supported(const struct dpll_device *dpll,
>>+				      const struct dpll_pin *pin,
>>+				      const enum dpll_pin_signal_type sig_type)
>>+{
>>+	return ice_dpll_pin_signal_type_supported(dpll, pin, sig_type,
>>+						  ICE_DPLL_PIN_TYPE_OUTPUT);
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_signal_type_get - get dpll's pin signal type
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @sig_type: on success - current signal type used on the pin
>>+ * @pin_type: type of a pin being checked
>>+ *
>>+ * Find a pin and assign sig_type with its current signal type value.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int ice_dpll_pin_signal_type_get(const struct dpll_device *dpll,
>>+					const struct dpll_pin *pin,
>>+					enum dpll_pin_signal_type *sig_type,
>>+					const enum ice_dpll_pin_type pin_type)
>>+{
>>+	struct ice_pf *pf =3D dpll_pin_priv(dpll, pin);
>>+	struct ice_dpll_pin *p;
>>+	int ret =3D -ENODEV;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	p =3D ice_find_pin(pf, pin, pin_type);
>>+	if (p) {
>>+		*sig_type =3D p->signal_type;
>>+		ret =3D 0;
>>+	}
>>+	mutex_unlock(&pf->dplls.lock);
>>+	dev_dbg(ice_pf_to_dev(pf),
>>+		"%s: dpll:%p, pin:%p, pf:%p, p:%p, p->pin:%p\n",
>>+		__func__, dpll, pin, pf, p, p ? p->pin : NULL);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_output_signal_type_get - get dpll's output pin signal type
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @sig_type: on success - current signal type value used on the pin
>>+ *
>>+ * Dpll subsystem callback. Find current signal type of given pin.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int ice_dpll_output_signal_type_get(const struct dpll_device
>>*dpll,
>>+					   const struct dpll_pin *pin,
>>+					   enum dpll_pin_signal_type *sig_type)
>>+{
>>+	return ice_dpll_pin_signal_type_get(dpll, pin, sig_type,
>>+					    ICE_DPLL_PIN_TYPE_OUTPUT);
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_signal_type_set - set dpll pin signal type
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @sig_type: signal type to be set
>>+ * @pin_type: type of a pin being configured
>>+ *
>>+ * Handler for signal type modification on pins. Set signal type value
>>for
>>+ * a given pin.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int ice_dpll_pin_signal_type_set(const struct dpll_device *dpll,
>>+					const struct dpll_pin *pin,
>>+					const enum dpll_pin_signal_type sig_type,
>>+					const enum ice_dpll_pin_type pin_type)
>>+{
>>+	struct ice_pf *pf =3D dpll_pin_priv(dpll, pin);
>>+	struct ice_dpll_pin *p;
>>+	int ret =3D -EFAULT;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	p =3D ice_find_pin(pf, pin, pin_type);
>>+	if (!p)
>>+		goto unlock;
>>+	if (test_bit(sig_type, &p->signal_type_mask))
>>+		ret =3D __ice_dpll_pin_signal_type_set(pf, p, pin_type,
>>sig_type);
>>+	else
>>+		ret =3D -EINVAL;
>>+unlock:
>>+	mutex_unlock(&pf->dplls.lock);
>>+	dev_dbg(ice_pf_to_dev(pf),
>>+		"%s: dpll:%p, pin:%p, pf:%p, p:%p, p->pin:%p, ret:%d\n",
>>+		__func__, dpll, pin, pf, p, p ? p->pin : NULL,  ret);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_output_signal_type_set - set dpll output pin signal type
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @sig_type: signal type to be set
>>+ *
>>+ * Dpll subsystem callback. Wraps signal type modification handler.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int
>>+ice_dpll_output_signal_type_set(const struct dpll_device *dpll,
>>+				const struct dpll_pin *pin,
>>+				const enum dpll_pin_signal_type sig_type)
>>+{
>>+	return ice_dpll_pin_signal_type_set(dpll, pin, sig_type,
>>+					    ICE_DPLL_PIN_TYPE_OUTPUT);
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_mode_enable - enables a pin mode
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be set
>>+ * @pin_type: type of pin being modified
>>+ *
>>+ * Handler for enabling the pin mode.
>>+ *
>>+ * Return:
>>+ * * 0 - successfully enabled mode
>>+ * * negative - failed to enable mode
>>+ */
>>+static int ice_dpll_pin_mode_enable(const struct dpll_device *dpll,
>>+				    const struct dpll_pin *pin,
>>+				    const enum dpll_pin_mode mode,
>>+				    const enum ice_dpll_pin_type pin_type)
>>+{
>>+	struct ice_pf *pf =3D dpll_pin_priv(dpll, pin);
>>+	struct ice_dpll_pin *p;
>>+	int ret =3D -EFAULT;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	p =3D ice_find_pin(pf, pin, pin_type);
>>+	if (p)
>>+		ret =3D ice_dpll_pin_mode_set(pf, p, pin_type, mode);
>>+	mutex_unlock(&pf->dplls.lock);
>>+	dev_dbg(ice_pf_to_dev(pf),
>>+		"%s: dpll:%p, pin:%p, pf:%p, p:%p, p->pin:%p, ret:%d\n",
>>+		__func__, dpll, pin, pf, p, p ? p->pin : NULL, ret);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_mode_enable - enable rclk-source pin mode
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be set
>>+ *
>>+ * Dpll subsystem callback. Enables given mode on recovered clock source
>>type
>>+ * pin.
>>+ *
>>+ * Return:
>>+ * * 0 - successfully enabled mode
>>+ * * negative - failed to enable mode
>>+ */
>>+static int ice_dpll_rclk_mode_enable(const struct dpll_device *dpll,
>>+				     const struct dpll_pin *pin,
>>+				     const enum dpll_pin_mode mode)
>>+{
>>+	return ice_dpll_pin_mode_enable(dpll, pin, mode,
>>+					 ICE_DPLL_PIN_TYPE_RCLK_SOURCE);
>>+}
>>+
>>+/**
>>+ * ice_dpll_output_mode_enable - enable output pin mode
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be set
>>+ *
>>+ * Dpll subsystem callback. Enables given mode on output type pin.
>>+ *
>>+ * Return:
>>+ * * 0 - successfully enabled mode
>>+ * * negative - failed to enable mode
>>+ */
>>+static int ice_dpll_output_mode_enable(const struct dpll_device *dpll,
>>+				       const struct dpll_pin *pin,
>>+				       const enum dpll_pin_mode mode)
>>+{
>>+	return ice_dpll_pin_mode_enable(dpll, pin, mode,
>>+					 ICE_DPLL_PIN_TYPE_OUTPUT);
>>+}
>>+
>>+/**
>>+ * ice_dpll_source_mode_enable - enable source pin mode
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be set
>>+ *
>>+ * Dpll subsystem callback. Enables given mode on source type pin.
>>+ *
>>+ * Return:
>>+ * * 0 - successfully enabled mode
>>+ * * negative - failed to enable mode
>>+ */
>>+static int ice_dpll_source_mode_enable(const struct dpll_device *dpll,
>>+				       const struct dpll_pin *pin,
>>+				       const enum dpll_pin_mode mode)
>>+{
>>+	return ice_dpll_pin_mode_enable(dpll, pin, mode,
>>+					 ICE_DPLL_PIN_TYPE_SOURCE);
>>+}
>>+
>>+/**
>>+ * ice_dpll_source_signal_type_get - get source pin signal type
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @type: on success - source pin signal type
>>+ *
>>+ * Dpll subsystem callback. Get source pin signal type value.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int ice_dpll_source_signal_type_get(const struct dpll_device
>>*dpll,
>>+					   const struct dpll_pin *pin,
>>+					   enum dpll_pin_signal_type *sig_type)
>>+{
>>+	return ice_dpll_pin_signal_type_get(dpll, pin, sig_type,
>>+					    ICE_DPLL_PIN_TYPE_SOURCE);
>>+}
>>+
>>+/**
>>+ * ice_dpll_source_signal_type_set - set dpll output pin signal type
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @sig_type: signal type to be set
>>+ *
>>+ * dpll subsystem callback. Set source pin signal type value.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int
>>+ice_dpll_source_signal_type_set(const struct dpll_device *dpll,
>>+				const struct dpll_pin *pin,
>>+				const enum dpll_pin_signal_type sig_type)
>>+{
>>+	return ice_dpll_pin_signal_type_set(dpll, pin, sig_type,
>>+					    ICE_DPLL_PIN_TYPE_SOURCE);
>>+}
>>+
>>+/**
>>+ * ice_dpll_source_prio_get - get dpll's source prio
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @prio: on success - returns source priority on dpll
>>+ *
>>+ * Dpll subsystem callback. Handler for getting priority of a source pin=
.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int ice_dpll_source_prio_get(const struct dpll_device *dpll,
>>+				    const struct dpll_pin *pin, u32 *prio)
>>+{
>>+	struct ice_pf *pf =3D dpll_pin_priv(dpll, pin);
>>+	struct ice_dpll *d =3D NULL;
>>+	struct ice_dpll_pin *p;
>>+	int ret =3D -EINVAL;
>>+
>>+	if (*prio > ICE_DPLL_PRIO_MAX)
>>+		return ret;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	p =3D ice_find_pin(pf, pin, ICE_DPLL_PIN_TYPE_SOURCE);
>>+	if (!p)
>>+		goto unlock;
>>+	d =3D ice_find_dpll(pf, dpll);
>>+	if (!d)
>>+		goto unlock;
>>+	*prio =3D d->input_prio[p->idx];
>>+	ret =3D 0;
>>+unlock:
>>+	mutex_unlock(&pf->dplls.lock);
>>+	dev_dbg(ice_pf_to_dev(pf), "%s: dpll:%p, pin:%p, pf:%p ret:%d\n",
>>+		__func__, dpll, pin, pf, ret);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_source_prio_set - set dpll source prio
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @prio: source priority to be set on dpll
>>+ *
>>+ * Dpll subsystem callback. Handler for setting priority of a source pin=
.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int ice_dpll_source_prio_set(const struct dpll_device *dpll,
>>+				    const struct dpll_pin *pin, const u32 prio)
>>+{
>>+	struct ice_pf *pf =3D dpll_pin_priv(dpll, pin);
>>+	struct ice_dpll *d =3D NULL;
>>+	struct ice_dpll_pin *p;
>>+	int ret =3D -EINVAL;
>>+
>>+	if (prio > ICE_DPLL_PRIO_MAX)
>>+		return ret;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	p =3D ice_find_pin(pf, pin, ICE_DPLL_PIN_TYPE_SOURCE);
>>+	if (!p)
>>+		goto unlock;
>>+	d =3D ice_find_dpll(pf, dpll);
>>+	if (!d)
>>+		goto unlock;
>>+	ret =3D ice_dpll_hw_source_prio_set(pf, d, p, prio);
>>+unlock:
>>+	mutex_unlock(&pf->dplls.lock);
>>+	dev_dbg(ice_pf_to_dev(pf), "%s: dpll:%p, pin:%p, pf:%p ret:%d\n",
>>+		__func__, dpll, pin, pf, ret);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_mode_active -  check if given pin's mode is active
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be checked
>>+ * @pin_type: type of a pin to be checked
>>+ *
>>+ * Handler for checking if given mode is active on a pin.
>>+ *
>>+ * Return:
>>+ * * true - mode is active
>>+ * * false - mode is not active
>>+ */
>>+static bool ice_dpll_pin_mode_active(const struct dpll_device *dpll,
>>+				     const struct dpll_pin *pin,
>>+				     const enum dpll_pin_mode mode,
>>+				     const enum ice_dpll_pin_type pin_type)
>>+{
>>+	struct ice_pf *pf =3D dpll_pin_priv(dpll, pin);
>>+	struct ice_dpll_pin *p;
>>+	bool ret =3D false;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	p =3D ice_find_pin(pf, pin, pin_type);
>>+	if (!p)
>>+		goto unlock;
>>+	if (test_bit(mode, &p->mode_mask))
>>+		ret =3D true;
>>+unlock:
>>+	mutex_unlock(&pf->dplls.lock);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_mode_active - check if rclk source pin's mode is active
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be checked
>>+ *
>>+ * DPLL subsystem callback, Wraps handler for checking if given mode is
>>active
>>+ * on a recovered clock pin.
>>+ *
>>+ * Return:
>>+ * * true - mode is active
>>+ * * false - mode is not active
>>+ */
>>+static bool ice_dpll_rclk_mode_active(const struct dpll_device *dpll,
>>+				      const struct dpll_pin *pin,
>>+				      const enum dpll_pin_mode mode)
>>+{
>>+	return ice_dpll_pin_mode_active(dpll, pin, mode,
>>+					 ICE_DPLL_PIN_TYPE_RCLK_SOURCE);
>>+}
>>+
>>+/**
>>+ * ice_dpll_output_mode_active - check if output pin's mode is active
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be checked
>>+ *
>>+ * DPLL subsystem callback, Wraps handler for checking if given mode is
>>active
>>+ * on an output pin.
>>+ *
>>+ * Return:
>>+ * * true - mode is active
>>+ * * false - mode is not active
>>+ */
>>+static bool ice_dpll_output_mode_active(const struct dpll_device *dpll,
>>+					const struct dpll_pin *pin,
>>+					const enum dpll_pin_mode mode)
>>+{
>>+	return ice_dpll_pin_mode_active(dpll, pin, mode,
>>+					ICE_DPLL_PIN_TYPE_OUTPUT);
>>+}
>>+
>>+/**
>>+ * ice_dpll_source_mode_active - check if source pin's mode is active
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be checked
>>+ *
>>+ * DPLL subsystem callback, Wraps handler for checking if given mode is
>>active
>>+ * on a source pin.
>>+ *
>>+ * Return:
>>+ * * true - mode is active
>>+ * * false - mode is not active
>>+ */
>>+static bool ice_dpll_source_mode_active(const struct dpll_device *dpll,
>>+					const struct dpll_pin *pin,
>>+					const enum dpll_pin_mode mode)
>>+{
>>+	return ice_dpll_pin_mode_active(dpll, pin, mode,
>>+					ICE_DPLL_PIN_TYPE_SOURCE);
>>+}
>>+
>>+/**
>>+ * ice_dpll_pin_mode_supported - check if pin's mode is supported
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be checked
>>+ * @pin_type: type of a pin being checked
>>+ *
>>+ * Handler for checking if given mode is supported on a pin.
>>+ *
>>+ * Return:
>>+ * * true - mode is active
>>+ * * false - mode is not active
>>+ */
>>+static bool ice_dpll_pin_mode_supported(const struct dpll_device *dpll,
>>+					const struct dpll_pin *pin,
>>+					const enum dpll_pin_mode mode,
>>+					const enum ice_dpll_pin_type pin_type)
>>+{
>>+	struct ice_pf *pf =3D dpll_pin_priv(dpll, pin);
>>+	struct ice_dpll_pin *p;
>>+	bool ret =3D false;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	p =3D ice_find_pin(pf, pin, pin_type);
>>+
>>+	if (!p)
>>+		goto unlock;
>>+	if (test_bit(mode, &p->mode_supported_mask))
>>+		ret =3D true;
>>+unlock:
>>+	mutex_unlock(&pf->dplls.lock);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_mode_supported - check if rclk pin's mode is supported
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be checked
>>+ *
>>+ * DPLL subsystem callback, Wraps handler for checking if given mode is
>>+ * supported on a clock recovery pin.
>>+ *
>>+ * Return:
>>+ * * true - mode is active
>>+ * * false - mode is not active
>>+ */
>>+static bool ice_dpll_rclk_mode_supported(const struct dpll_device *dpll,
>>+					 const struct dpll_pin *pin,
>>+					 const enum dpll_pin_mode mode)
>>+{
>>+	return ice_dpll_pin_mode_supported(dpll, pin, mode,
>>+					    ICE_DPLL_PIN_TYPE_RCLK_SOURCE);
>>+}
>>+
>>+/**
>>+ * ice_dpll_output_mode_supported - check if output pin's mode is
>>supported
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be checked
>>+ *
>>+ * DPLL subsystem callback, Wraps handler for checking if given mode is
>>+ * supported on an output pin.
>>+ *
>>+ * Return:
>>+ * * true - mode is active
>>+ * * false - mode is not active
>>+ */
>>+static bool ice_dpll_output_mode_supported(const struct dpll_device
>>*dpll,
>>+					   const struct dpll_pin *pin,
>>+					   const enum dpll_pin_mode mode)
>>+{
>>+	return ice_dpll_pin_mode_supported(dpll, pin, mode,
>>+					    ICE_DPLL_PIN_TYPE_OUTPUT);
>>+}
>>+
>>+/**
>>+ * ice_dpll_source_mode_supported - check if source pin's mode is
>>supported
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @mode: mode to be checked
>>+ *
>>+ * DPLL subsystem callback, Wraps handler for checking if given mode is
>>+ * supported on a source pin.
>>+ *
>>+ * Return:
>>+ * * true - mode is active
>>+ * * false - mode is not active
>>+ */
>>+static bool ice_dpll_source_mode_supported(const struct dpll_device
>>*dpll,
>>+					   const struct dpll_pin *pin,
>>+					   const enum dpll_pin_mode mode)
>>+{
>>+	return ice_dpll_pin_mode_supported(dpll, pin, mode,
>>+					    ICE_DPLL_PIN_TYPE_SOURCE);
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_pin_sig_type_get - get signal type of rclk pin
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @sig_type: on success - holds a signal type of a pin
>>+ *
>>+ * DPLL subsystem callback, provides signal type of clock recovery pin.
>>+ *
>>+ * Return:
>>+ * * 0 - success, sig_type value is valid
>>+ * * negative - error
>>+ */
>>+static int ice_dpll_rclk_pin_sig_type_get(const struct dpll_device *dpll=
,
>>+					  const struct dpll_pin *pin,
>>+					  enum dpll_pin_signal_type *sig_type)
>>+{
>>+	struct ice_pf *pf =3D dpll_pin_priv(dpll, pin);
>>+	struct ice_dpll_pin *p;
>>+	int ret =3D 0;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	p =3D ice_find_pin(pf, pin, ICE_DPLL_PIN_TYPE_RCLK_SOURCE);
>>+	if (!p) {
>>+		ret =3D -EFAULT;
>>+		goto unlock;
>>+	}
>>+	*sig_type =3D p->signal_type;
>>+unlock:
>>+	mutex_unlock(&pf->dplls.lock);
>>+	dev_dbg(ice_pf_to_dev(pf), "%s: dpll:%p, pin:%p, pf:%p sig_type:%d
>>ret:%d\n",
>>+		__func__, dpll, pin, pf, *sig_type, ret);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_pin_net_if_index_get - get OS interface index callback
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ * @net_if_idx: on success - holds OS interface index
>>+ *
>>+ * dpll subsystem callback, obtains OS interface index and pass to the
>>caller.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int ice_dpll_rclk_pin_net_if_index_get(const struct dpll_device
>>*dpll,
>>+					      const struct dpll_pin *pin,
>>+					      int *net_if_idx)
>>+{
>>+	struct ice_pf *pf =3D dpll_pin_priv(dpll, pin);
>>+
>>+	if (!pf->vsi[0] || pf->vsi[0]->netdev)
>>+		return -EAGAIN;
>>+	*net_if_idx =3D pf->vsi[0]->netdev->ifindex;
>>+
>>+	return 0;
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_pin_select - select a recovered clock pin as a valid
>>source
>>+ * @dpll: registered dpll pointer
>>+ * @pin: pointer to a pin
>>+ *
>>+ * dpll subsystem callback, selects a pin for clock recovery,
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - failure
>>+ */
>>+static int ice_dpll_rclk_pin_select(const struct dpll_device *dpll,
>>+				    const struct dpll_pin *pin)
>>+{
>>+	struct ice_pf *pf =3D dpll_pin_priv(dpll, pin);
>>+	struct ice_dpll_pin *p;
>>+	u32 freq;
>>+	int ret;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	p =3D ice_find_pin(pf, pin, ICE_DPLL_PIN_TYPE_RCLK_SOURCE);
>>+	if (!p) {
>>+		ret =3D -EFAULT;
>>+		goto unlock;
>>+	}
>>+	if (!(p->flags & ICE_DPLL_RCLK_SOURCE_FLAG_EN)) {
>>+		ret =3D -EPERM;
>>+		goto unlock;
>>+	}
>>+	ret =3D ice_aq_set_phy_rec_clk_out(&pf->hw, p->idx, true, &freq);
>>+unlock:
>>+	mutex_unlock(&pf->dplls.lock);
>>+	dev_dbg(ice_pf_to_dev(pf), "%s: dpll:%p, pin:%p, pf:%p ret:%d\n",
>>+		__func__, dpll, pin, pf, ret);
>>+
>>+	return ret;
>>+}
>>+
>>+static struct dpll_pin_ops ice_dpll_rclk_ops =3D {
>>+	.mode_enable =3D ice_dpll_rclk_mode_enable,
>>+	.mode_active =3D ice_dpll_rclk_mode_active,
>>+	.mode_supported =3D ice_dpll_rclk_mode_supported,
>>+	.signal_type_get =3D ice_dpll_rclk_pin_sig_type_get,
>>+	.signal_type_supported =3D ice_dpll_rclk_signal_type_supported,
>>+	.net_if_idx_get =3D ice_dpll_rclk_pin_net_if_index_get,
>>+	.select =3D ice_dpll_rclk_pin_select,
>>+};
>>+
>>+static struct dpll_pin_ops ice_dpll_source_ops =3D {
>>+	.signal_type_get =3D ice_dpll_source_signal_type_get,
>>+	.signal_type_set =3D ice_dpll_source_signal_type_set,
>>+	.signal_type_supported =3D ice_dpll_source_signal_type_supported,
>>+	.mode_active =3D ice_dpll_source_mode_active,
>>+	.mode_enable =3D ice_dpll_source_mode_enable,
>>+	.mode_supported =3D ice_dpll_source_mode_supported,
>>+	.prio_get =3D ice_dpll_source_prio_get,
>>+	.prio_set =3D ice_dpll_source_prio_set,
>>+};
>>+
>>+static struct dpll_pin_ops ice_dpll_output_ops =3D {
>>+	.signal_type_get =3D ice_dpll_output_signal_type_get,
>>+	.signal_type_set =3D ice_dpll_output_signal_type_set,
>>+	.signal_type_supported =3D ice_dpll_output_signal_type_supported,
>>+	.mode_active =3D ice_dpll_output_mode_active,
>>+	.mode_enable =3D ice_dpll_output_mode_enable,
>>+	.mode_supported =3D ice_dpll_output_mode_supported,
>>+};
>>+
>>+static struct dpll_device_ops ice_dpll_ops =3D {
>>+	.lock_status_get =3D ice_dpll_lock_status_get,
>>+	.source_pin_idx_get =3D ice_dpll_source_idx_get,
>>+	.mode_get =3D ice_dpll_mode_get,
>>+	.mode_supported =3D ice_dpll_mode_supported,
>>+};
>>+
>>+/**
>>+ * ice_dpll_release_info - release memory allocated for pins
>>+ * @pf: board private structure
>>+ *
>>+ * Release memory allocated for pins by ice_dpll_init_info function.
>>+ */
>>+static void ice_dpll_release_info(struct ice_pf *pf)
>>+{
>>+	kfree(pf->dplls.inputs);
>>+	pf->dplls.inputs =3D NULL;
>>+	kfree(pf->dplls.outputs);
>>+	pf->dplls.outputs =3D NULL;
>>+	kfree(pf->dplls.eec.input_prio);
>>+	pf->dplls.eec.input_prio =3D NULL;
>>+	kfree(pf->dplls.pps.input_prio);
>>+	pf->dplls.pps.input_prio =3D NULL;
>>+}
>>+
>>+/**
>>+ * ice_dpll_init_pins - initializes source or output pins information
>>+ * @pf: Board private structure
>>+ * @pin_type: type of pins being initialized
>>+ *
>>+ * Init information about input or output pins, cache them in pins
>>struct.
>>+ */
>>+static int ice_dpll_init_pins(struct ice_pf *pf,
>>+			      const enum ice_dpll_pin_type pin_type)
>>+{
>>+	struct ice_dpll *de =3D &pf->dplls.eec, *dp =3D &pf->dplls.pps;
>>+	int ret =3D -EINVAL, num_pins, i;
>>+	struct ice_hw *hw =3D &pf->hw;
>>+	struct ice_dpll_pin *pins;
>>+	bool input;
>>+
>>+	if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_SOURCE) {
>>+		input =3D true;
>>+		pins =3D pf->dplls.inputs;
>>+		num_pins =3D pf->dplls.num_inputs;
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_OUTPUT) {
>>+		input =3D false;
>>+		pins =3D pf->dplls.outputs;
>>+		num_pins =3D pf->dplls.num_outputs;
>>+	} else {
>>+		return -EINVAL;
>>+	}
>>+
>>+	for (i =3D 0; i < num_pins; i++) {
>>+		pins[i].idx =3D i;
>>+		pins[i].name =3D ice_cgu_get_pin_name(hw, i, input);
>>+		pins[i].type =3D ice_cgu_get_pin_type(hw, i, input);
>>+		set_bit(DPLL_PIN_MODE_CONNECTED,
>>+			&pins[i].mode_supported_mask);
>>+		set_bit(DPLL_PIN_MODE_DISCONNECTED,
>>+			&pins[i].mode_supported_mask);
>>+		if (input) {
>>+			ret =3D ice_aq_get_cgu_ref_prio(hw, de->dpll_idx, i,
>>+						      &de->input_prio[i]);
>>+			if (ret)
>>+				return ret;
>>+			ret =3D ice_aq_get_cgu_ref_prio(hw, dp->dpll_idx, i,
>>+						      &dp->input_prio[i]);
>>+			if (ret)
>>+				return ret;
>>+			set_bit(DPLL_PIN_MODE_SOURCE,
>>+				&pins[i].mode_supported_mask);
>>+		} else {
>>+			set_bit(DPLL_PIN_MODE_OUTPUT,
>>+				&pins[i].mode_supported_mask);
>>+		}
>>+		pins[i].signal_type_mask =3D
>>+				ice_cgu_get_pin_sig_type_mask(hw, i, input);
>>+		ret =3D ice_dpll_pin_update(hw, &pins[i], pin_type);
>>+		if (ret)
>>+			return ret;
>>+	}
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_release_pins - release pin's from dplls registered in
>>subsystem
>>+ * @dpll_eec: dpll_eec dpll pointer
>>+ * @dpll_pps: dpll_pps dpll pointer
>>+ * @pins: pointer to pins array
>>+ * @count: number of pins
>>+ *
>>+ * Deregister and free pins of a given array of pins from dpll devices
>>registered
>>+ * in dpll subsystem.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * positive - number of errors encounterd on pin's deregistration.
>>+ */
>>+static int
>>+ice_dpll_release_pins(struct dpll_device *dpll_eec,
>>+		      struct dpll_device *dpll_pps, struct ice_dpll_pin *pins,
>>+		      int count)
>>+{
>>+	int i, ret, err;
>>+
>>+	for (i =3D 0; i < count; i++) {
>>+		struct ice_dpll_pin *p =3D &pins[i];
>>+
>>+		if (p && p->pin) {
>>+			if (dpll_eec) {
>>+				ret =3D dpll_pin_deregister(dpll_eec, p->pin);
>>+				if (ret)
>>+					err++;
>>+			}
>>+			if (dpll_pps) {
>>+				ret =3D dpll_pin_deregister(dpll_pps, p->pin);
>>+				if (ret)
>>+					err++;
>>+			}
>>+			dpll_pin_free(p->pin);
>>+			p->pin =3D NULL;
>>+		}
>>+	}
>>+
>>+	return err;
>>+}
>>+
>>+/**
>>+ * ice_dpll_register_pins - register pins with a dpll
>>+ * @pf: board private structure
>>+ * @dpll: registered dpll pointer
>>+ * @pin_type: type of pins being registered
>>+ *
>>+ * Register source or output pins within given DPLL in a Linux dpll
>>subsystem.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - error
>>+ */
>>+static int
>>+ice_dpll_register_pins(struct ice_pf *pf, struct dpll_device *dpll,
>>+		       const enum ice_dpll_pin_type pin_type)
>>+{
>>+	struct ice_dpll_pin *pins;
>>+	struct dpll_pin_ops *ops;
>>+	int ret, i, count;
>>+
>>+	if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_SOURCE) {
>>+		ops =3D &ice_dpll_source_ops;
>>+		pins =3D pf->dplls.inputs;
>>+		count =3D pf->dplls.num_inputs;
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_OUTPUT) {
>>+		ops =3D &ice_dpll_output_ops;
>>+		pins =3D pf->dplls.outputs;
>>+		count =3D pf->dplls.num_outputs;
>>+	} else {
>>+		return -EINVAL;
>>+	}
>>+
>>+	for (i =3D 0; i < count; i++) {
>>+		pins[i].pin =3D dpll_pin_alloc(pins[i].name, pins[i].type);
>>+		if (IS_ERR_OR_NULL(pins[i].pin))
>>+			return -ENOMEM;
>>+
>>+		ret =3D dpll_pin_register(dpll, pins[i].pin, ops, pf);
>>+		if (ret)
>>+			return -ENOSPC;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+/**
>>+ * ice_dpll_register_shared_pins - register shared pins in DPLL subsyste=
m
>>+ * @pf: board private structure
>>+ * @dpll_o: registered dpll pointer (owner)
>>+ * @dpll: registered dpll pointer
>>+ * @type: type of pins being registered
>>+ *
>>+ * Register pins from given owner dpll within given dpll in Linux dpll
>>subsystem.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - error
>>+ */
>>+static int
>>+ice_dpll_register_shared_pins(struct ice_pf *pf, struct dpll_device
>>*dpll_o,
>>+			      struct dpll_device *dpll,
>>+			      const enum ice_dpll_pin_type pin_type)
>>+{
>>+	struct ice_dpll_pin *pins;
>>+	struct dpll_pin_ops *ops;
>>+	int ret, i, count;
>>+
>>+	if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_SOURCE) {
>>+		ops =3D &ice_dpll_source_ops;
>>+		pins =3D pf->dplls.inputs;
>>+		count =3D pf->dplls.num_inputs;
>>+	} else if (pin_type =3D=3D ICE_DPLL_PIN_TYPE_OUTPUT) {
>>+		ops =3D &ice_dpll_output_ops;
>>+		pins =3D pf->dplls.outputs;
>>+		count =3D pf->dplls.num_outputs;
>>+	} else {
>>+		return -EINVAL;
>>+	}
>>+
>>+	for (i =3D 0; i < count; i++) {
>>+		ret =3D dpll_shared_pin_register(dpll_o, dpll, pins[i].name,
>>+					       ops, pf);
>>+		if (ret)
>>+			return ret;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+/**
>>+ * ice_dpll_init_info - prepare pf's dpll information structure
>>+ * @pf: board private structure
>>+ *
>>+ * Acquire (from HW) and set basic dpll information (on pf->dplls
>>struct).
>>+ *
>>+ * Return:
>>+ *  0 - success
>>+ *  negative - error
>>+ */
>>+static int ice_dpll_init_info(struct ice_pf *pf)
>>+{
>>+	struct ice_aqc_get_cgu_abilities abilities;
>>+	struct ice_dpll *de =3D &pf->dplls.eec;
>>+	struct ice_dpll *dp =3D &pf->dplls.pps;
>>+	struct ice_dplls *d =3D &pf->dplls;
>>+	struct ice_hw *hw =3D &pf->hw;
>>+	int ret, alloc_size;
>>+
>>+	ret =3D ice_aq_get_cgu_abilities(hw, &abilities);
>>+	if (ret) {
>>+		dev_err(ice_pf_to_dev(pf),
>>+			"err:%d %s failed to read cgu abilities\n",
>>+			ret, ice_aq_str(hw->adminq.sq_last_status));
>>+		return ret;
>>+	}
>>+
>>+	de->dpll_idx =3D abilities.eec_dpll_idx;
>>+	dp->dpll_idx =3D abilities.pps_dpll_idx;
>>+	d->num_inputs =3D abilities.num_inputs;
>>+	alloc_size =3D sizeof(*d->inputs) * d->num_inputs;
>>+	d->inputs =3D kzalloc(alloc_size, GFP_KERNEL);
>>+	if (!d->inputs)
>>+		return -ENOMEM;
>>+
>>+	alloc_size =3D sizeof(*de->input_prio) * d->num_inputs;
>>+	de->input_prio =3D kzalloc(alloc_size, GFP_KERNEL);
>>+	if (!de->input_prio)
>>+		return -ENOMEM;
>>+
>>+	dp->input_prio =3D kzalloc(alloc_size, GFP_KERNEL);
>>+	if (!dp->input_prio)
>>+		return -ENOMEM;
>>+
>>+	ret =3D ice_dpll_init_pins(pf, ICE_DPLL_PIN_TYPE_SOURCE);
>>+	if (ret)
>>+		goto release_info;
>>+
>>+	d->num_outputs =3D abilities.num_outputs;
>>+	alloc_size =3D sizeof(*d->outputs) * d->num_outputs;
>>+	d->outputs =3D kzalloc(alloc_size, GFP_KERNEL);
>>+	if (!d->outputs)
>>+		goto release_info;
>>+
>>+	ret =3D ice_dpll_init_pins(pf, ICE_DPLL_PIN_TYPE_OUTPUT);
>>+	if (ret)
>>+		goto release_info;
>>+
>>+	dev_dbg(ice_pf_to_dev(pf), "%s - success, inputs:%u, outputs:%u\n",
>>__func__,
>>+		abilities.num_inputs, abilities.num_outputs);
>>+
>>+	return 0;
>>+
>>+release_info:
>>+	dev_err(ice_pf_to_dev(pf),
>>+		"%s - fail: d->inputs:%p, de->input_prio:%p, dp->input_prio:%p,
>>d->outputs:%p\n",
>>+		__func__, d->inputs, de->input_prio,
>>+		dp->input_prio, d->outputs);
>>+	ice_dpll_release_info(pf);
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_generate_clock_id - generates unique clock_id for registering
>>dpll.
>>+ * @pf: board private structure
>>+ * @clock_id: holds generated clock_id
>>+ *
>>+ * Generates unique (per board) clock_id for allocation and search of
>>dpll
>>+ * devices in Linux dpll subsystem.
>>+ */
>>+static void ice_generate_clock_id(struct ice_pf *pf, u64 *clock_id)
>>+{
>>+	*clock_id =3D pci_get_dsn(pf->pdev);
>>+}
>>+
>>+/**
>>+ * ice_dpll_init_dpll
>>+ * @pf: board private structure
>>+ *
>>+ * Allocate and register dpll in dpll subsystem.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - allocation fails
>>+ */
>>+static int ice_dpll_init_dpll(struct ice_pf *pf)
>>+{
>>+	struct device *dev =3D ice_pf_to_dev(pf);
>>+	struct ice_dpll *de =3D &pf->dplls.eec;
>>+	struct ice_dpll *dp =3D &pf->dplls.pps;
>>+	u64 clock_id =3D 0;
>>+	int ret =3D 0;
>>+
>>+	ice_generate_clock_id(pf, &clock_id);
>>+
>>+	de->dpll =3D dpll_device_alloc(&ice_dpll_ops, DPLL_TYPE_EEC,
>>+				     clock_id, DPLL_CLOCK_CLASS_C, 0, pf, dev);
>>+	if (!de->dpll) {
>>+		dev_err(ice_pf_to_dev(pf), "dpll_device_alloc failed (eec)\n");
>>+		return -ENOMEM;
>>+	}
>>+
>>+	dp->dpll =3D dpll_device_alloc(&ice_dpll_ops, DPLL_TYPE_PPS,
>>+				     clock_id, DPLL_CLOCK_CLASS_C, 0, pf, dev);
>>+	if (!dp->dpll) {
>>+		dev_err(ice_pf_to_dev(pf), "dpll_device_alloc failed (pps)\n");
>>+		return -ENOMEM;
>>+	}
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_update_state
>>+ * @hw: board private structure
>>+ * @d: pointer to queried dpll device
>>+ *
>>+ * Poll current state of dpll from hw and update ice_dpll struct.
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - AQ failure
>>+ */
>>+static int ice_dpll_update_state(struct ice_hw *hw, struct ice_dpll *d)
>>+{
>>+	int ret;
>>+
>>+	ret =3D ice_get_cgu_state(hw, d->dpll_idx, d->prev_dpll_state,
>>+				&d->source_idx, &d->ref_state, &d->eec_mode,
>>+				&d->phase_offset, &d->dpll_state);
>>+
>>+	dev_dbg(ice_pf_to_dev((struct ice_pf *)(hw->back)),
>>+		"update dpll=3D%d, src_idx:%u, state:%d, prev:%d\n",
>>+		d->dpll_idx, d->source_idx,
>>+		d->dpll_state, d->prev_dpll_state);
>>+
>>+	if (ret)
>>+		dev_err(ice_pf_to_dev((struct ice_pf *)(hw->back)),
>>+			"update dpll=3D%d state failed, ret=3D%d %s\n",
>>+			d->dpll_idx, ret,
>>+			ice_aq_str(hw->adminq.sq_last_status));
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_notify_changes - notify dpll subsystem about changes
>>+ * @d: pointer do dpll
>>+ *
>>+ * Once change detected appropriate event is submitted to the dpll
>>subsystem.
>>+ */
>>+static void ice_dpll_notify_changes(struct ice_dpll *d)
>>+{
>>+	if (d->prev_dpll_state !=3D d->dpll_state) {
>>+		d->prev_dpll_state =3D d->dpll_state;
>>+		dpll_device_notify(d->dpll, DPLL_CHANGE_LOCK_STATUS);
>>+	}
>>+	if (d->prev_source_idx !=3D d->source_idx) {
>>+		d->prev_source_idx =3D d->source_idx;
>>+		dpll_device_notify(d->dpll, DPLL_CHANGE_SOURCE_PIN);
>>+	}
>>+}
>>+
>>+/**
>>+ * ice_dpll_periodic_work - DPLLs periodic worker
>>+ * @work: pointer to kthread_work structure
>>+ *
>>+ * DPLLs periodic worker is responsible for polling state of dpll.
>>+ */
>>+static void ice_dpll_periodic_work(struct kthread_work *work)
>>+{
>>+	struct ice_dplls *d =3D container_of(work, struct ice_dplls,
>>work.work);
>>+	struct ice_pf *pf =3D container_of(d, struct ice_pf, dplls);
>>+	struct ice_dpll *de =3D &pf->dplls.eec;
>>+	struct ice_dpll *dp =3D &pf->dplls.pps;
>>+	int ret =3D 0;
>>+
>>+	if (!test_bit(ICE_FLAG_DPLL, pf->flags))
>
>Why do you need to check the flag there, this would should not be
>ever scheduled in case the flag was not set.
>

It's here rather for stopping the worker, It shall no longer reschedule and
bail out.

>
>>+		return;
>>+	mutex_lock(&d->lock);
>>+	ret =3D ice_dpll_update_state(&pf->hw, de);
>>+	if (!ret)
>>+		ret =3D ice_dpll_update_state(&pf->hw, dp);
>>+	if (ret) {
>>+		d->cgu_state_acq_err_num++;
>>+		/* stop rescheduling this worker */
>>+		if (d->cgu_state_acq_err_num >
>>+		    CGU_STATE_ACQ_ERR_THRESHOLD) {
>>+			dev_err(ice_pf_to_dev(pf),
>>+				"EEC/PPS DPLLs periodic work disabled\n");
>>+			return;
>>+		}
>>+	}
>>+	mutex_unlock(&d->lock);
>>+	ice_dpll_notify_changes(de);
>>+	ice_dpll_notify_changes(dp);
>>+
>>+	/* Run twice a second or reschedule if update failed */
>>+	kthread_queue_delayed_work(d->kworker, &d->work,
>>+				   ret ? msecs_to_jiffies(10) :
>>+				   msecs_to_jiffies(500));
>>+}
>>+
>>+/**
>>+ * ice_dpll_init_worker - Initialize DPLLs periodic worker
>>+ * @pf: board private structure
>>+ *
>>+ * Create and start DPLLs periodic worker.
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - create worker failure
>>+ */
>>+static int ice_dpll_init_worker(struct ice_pf *pf)
>>+{
>>+	struct ice_dplls *d =3D &pf->dplls;
>>+	struct kthread_worker *kworker;
>>+
>>+	ice_dpll_update_state(&pf->hw, &d->eec);
>>+	ice_dpll_update_state(&pf->hw, &d->pps);
>>+	kthread_init_delayed_work(&d->work, ice_dpll_periodic_work);
>>+	kworker =3D kthread_create_worker(0, "ice-dplls-%s",
>>+					dev_name(ice_pf_to_dev(pf)));
>>+	if (IS_ERR(kworker))
>>+		return PTR_ERR(kworker);
>>+	d->kworker =3D kworker;
>>+	d->cgu_state_acq_err_num =3D 0;
>>+	kthread_queue_delayed_work(d->kworker, &d->work, 0);
>>+
>>+	return 0;
>>+}
>>+
>>+/**
>>+ * __ice_dpll_release - Disable the driver/HW support for DPLL and
>>unregister
>>+ * the dpll device.
>>+ * @pf: board private structure
>>+ *
>>+ * This function handles the cleanup work required from the
>>initialization by
>>+ * freeing resources and unregistering the dpll.
>>+ *
>>+ * Context: Called under pf->dplls.lock
>>+ */
>>+static void __ice_dpll_release(struct ice_pf *pf)
>>+{
>>+	struct ice_dplls *d =3D &pf->dplls;
>>+	struct ice_dpll *de =3D &d->eec;
>>+	struct ice_dpll *dp =3D &d->pps;
>>+	int ret;
>>+
>>+	ret =3D ice_dpll_release_pins(de->dpll, dp->dpll, d->inputs,
>>+				    d->num_inputs);
>>+	if (ret)
>>+		dev_warn(ice_pf_to_dev(pf),
>>+			 "pin deregister on PPS dpll err=3D%d\n", ret);
>>+	ret =3D ice_dpll_release_pins(de->dpll, dp->dpll, d->outputs,
>>+				    d->num_outputs);
>>+	if (ret)
>>+		dev_warn(ice_pf_to_dev(pf),
>>+			 "pin deregister on PPS dpll err=3D%d\n", ret);
>>+	ice_dpll_release_info(pf);
>>+	if (dp->dpll) {
>>+		dpll_device_unregister(dp->dpll);
>>+		dpll_device_free(dp->dpll);
>>+		dev_dbg(ice_pf_to_dev(pf), "PPS dpll removed\n");
>>+	}
>>+
>>+	if (de->dpll) {
>>+		dpll_device_unregister(de->dpll);
>>+		dpll_device_free(de->dpll);
>>+		dev_dbg(ice_pf_to_dev(pf), "EEC dpll removed\n");
>>+	}
>>+
>>+	kthread_cancel_delayed_work_sync(&d->work);
>>+	if (d->kworker) {
>>+		kthread_destroy_worker(d->kworker);
>>+		d->kworker =3D NULL;
>>+		dev_dbg(ice_pf_to_dev(pf), "DPLLs worker removed\n");
>>+	}
>>+}
>>+
>>+/**
>>+ * ice_dpll_init - Initialize DPLLs support
>>+ * @pf: board private structure
>>+ *
>>+ * Set up the device as owner of DPLLs registering them and pins
>>connected
>>+ * within Linux dpll subsystem. Allow userpsace to obtain state of DPLL
>>+ * and handling of DPLL configuration requests.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - init failure
>>+ */
>>+int ice_dpll_init(struct ice_pf *pf)
>>+{
>>+	struct ice_dplls *d =3D &pf->dplls;
>>+	int err;
>>+
>>+	mutex_init(&d->lock);
>>+	mutex_lock(&d->lock);
>
>It is always odd to see the lock being created and locked right away.
>Why do you need to lock it here?
>

Once dpll is registered it can start sending requests, we want to have full=
y
initialized dpll/pins before that. Lock could be done after ice_dpll_init_i=
nfo.

>
>>+	err =3D ice_dpll_init_info(pf);
>>+	if (err)
>>+		goto unlock;
>>+	err =3D ice_dpll_init_dpll(pf);
>>+	if (err)
>>+		goto release;
>>+	err =3D ice_dpll_register_pins(pf, d->eec.dpll,
>>ICE_DPLL_PIN_TYPE_SOURCE);
>>+	if (err)
>>+		goto release;
>>+	err =3D ice_dpll_register_pins(pf, d->eec.dpll,
>>ICE_DPLL_PIN_TYPE_OUTPUT);
>>+	if (err)
>>+		goto release;
>>+	err =3D ice_dpll_register_shared_pins(pf, d->eec.dpll, d->pps.dpll,
>>+					    ICE_DPLL_PIN_TYPE_SOURCE);
>>+	if (err)
>>+		goto release;
>>+	err =3D ice_dpll_register_shared_pins(pf, d->eec.dpll, d->pps.dpll,
>>+					    ICE_DPLL_PIN_TYPE_OUTPUT);
>>+	if (err)
>>+		goto release;
>>+	set_bit(ICE_FLAG_DPLL, pf->flags);
>>+	err =3D ice_dpll_init_worker(pf);
>>+	if (err)
>>+		goto release;
>>+	mutex_unlock(&d->lock);
>>+	dev_dbg(ice_pf_to_dev(pf), "DPLLs init successful\n");
>>+
>>+	return err;
>>+release:
>>+	__ice_dpll_release(pf);
>>+unlock:
>>+	clear_bit(ICE_FLAG_DPLL, pf->flags);
>>+	mutex_unlock(&d->lock);
>>+	mutex_destroy(&d->lock);
>>+	dev_warn(ice_pf_to_dev(pf), "DPLLs init failure\n");
>>+
>>+	return err;
>>+}
>>+
>>+/**
>>+ * ice_dpll_release - Disable the driver/HW support for DPLLs and
>>unregister
>>+ * the dpll device.
>>+ * @pf: board private structure
>>+ *
>>+ * This function handles the cleanup work required from the
>>initialization by
>>+ * freeing resources and unregistering the dpll.
>>+ */
>>+void ice_dpll_release(struct ice_pf *pf)
>>+{
>>+	if (test_bit(ICE_FLAG_DPLL, pf->flags)) {
>>+		mutex_lock(&pf->dplls.lock);
>>+		clear_bit(ICE_FLAG_DPLL, pf->flags);
>>+		__ice_dpll_release(pf);
>>+		mutex_unlock(&pf->dplls.lock);
>>+		mutex_destroy(&pf->dplls.lock);
>>+	}
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_pin_init - init the pin info for recovered clock
>>+ * @attr: structure with pin attributes
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - init failure
>>+ */
>>+void ice_dpll_rclk_pin_init(struct ice_dpll_pin *p)
>>+{
>>+	p->flags =3D ICE_DPLL_RCLK_SOURCE_FLAG_EN;
>>+	p->type =3D DPLL_PIN_TYPE_SYNCE_ETH_PORT;
>>+	set_bit(DPLL_PIN_SIGNAL_TYPE_CUSTOM_FREQ, &p->signal_type_mask);
>>+	set_bit(DPLL_PIN_MODE_CONNECTED,	  &p->mode_supported_mask);
>>+	set_bit(DPLL_PIN_MODE_DISCONNECTED,	  &p->mode_supported_mask);
>>+	set_bit(DPLL_PIN_MODE_SOURCE,		  &p->mode_supported_mask);
>>+	ice_dpll_pin_update(0, p, ICE_DPLL_PIN_TYPE_RCLK_SOURCE);
>>+}
>>+
>>+/**
>>+ * __ice_dpll_rclk_release - unregister the recovered pin for dpll devic=
e
>>+ * @pf: board private structure
>>+ *
>>+ * This function handles the cleanup work required from the
>>initialization by
>>+ * freeing resources and unregistering the recovered pin.
>>+ */
>>+void __ice_dpll_rclk_release(struct ice_pf *pf)
>>+{
>>+	int ret =3D 0;
>>+
>>+	if (pf->dplls.eec.dpll) {
>>+		if (pf->dplls.rclk[0].pin)
>>+			ret =3D dpll_pin_deregister(pf->dplls.eec.dpll,
>>+						  pf->dplls.rclk[0].pin);
>>+		dpll_pin_free(pf->dplls.rclk->pin);
>>+		kfree(pf->dplls.rclk);
>>+	}
>>+	dev_dbg(ice_pf_to_dev(pf), "PHY RCLK release ret:%d\n", ret);
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_pins_init - init the pin for recovered clock
>>+ * @pf: board private structure
>>+ * @first_parent: pointer to a first parent pin
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - init failure
>>+ */
>>+int ice_dpll_rclk_pins_init(struct ice_pf *pf, struct ice_dpll_pin
>>*first_parent)
>>+{
>>+	struct ice_dpll_pin *parent, *p;
>>+	char *name;
>>+	int i, ret;
>>+
>>+	if (pf->dplls.rclk)
>>+		return -EEXIST;
>>+	pf->dplls.rclk =3D kcalloc(pf->dplls.num_rclk, sizeof(*pf->dplls.rclk),
>>+				 GFP_KERNEL);
>>+	if (!pf->dplls.rclk)
>>+		goto release;
>>+	for (i =3D ICE_RCLKA_PIN; i < pf->dplls.num_rclk; i++) {
>>+		p =3D &pf->dplls.rclk[i];
>>+		if (!p)
>>+			goto release;
>>+		ice_dpll_rclk_pin_init(p);
>>+		parent =3D first_parent + i;
>>+		if (!parent)
>>+			goto release;
>>+		p->idx =3D i;
>>+		name =3D kcalloc(DPLL_PIN_DESC_LEN, sizeof(*p->name),
>>GFP_KERNEL);
>>+		if (!name)
>>+			goto release;
>>+		snprintf(name, DPLL_PIN_DESC_LEN - 1, "%s-%u",
>>+			 parent->name, pf->hw.pf_id);
>>+		p->name =3D name;
>>+		p->pin =3D dpll_pin_alloc(p->name, p->type);
>>+		if (IS_ERR_OR_NULL(p->pin))
>>+			goto release;
>>+		ret =3D dpll_muxed_pin_register(pf->dplls.eec.dpll, parent->name,
>>+					      p->pin, &ice_dpll_rclk_ops, pf);
>>+		if (ret)
>>+			goto release;
>>+		ret =3D dpll_shared_pin_register(pf->dplls.eec.dpll,
>>+					       pf->dplls.pps.dpll,
>>+					       p->name,
>>+					       &ice_dpll_rclk_ops, pf);
>>+		if (ret)
>>+			goto release;
>>+	}
>>+
>>+	return ret;
>>+release:
>>+	dev_dbg(ice_pf_to_dev(pf),
>>+		"%s releasing - p: %p, parent:%p, p->pin:%p name:%s, ret:%d\n",
>>+		__func__, p, parent, p->pin, name, ret);
>>+	__ice_dpll_rclk_release(pf);
>>+	return -ENOMEM;
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_find_dplls - find the device-wide DPLLs by clock_id
>>+ * @pf: board private structure
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - init failure
>>+ */
>>+static int ice_dpll_rclk_find_dplls(struct ice_pf *pf)
>>+{
>>+	u64 clock_id =3D 0;
>>+
>>+	ice_generate_clock_id(pf, &clock_id);
>>+	pf->dplls.eec.dpll =3D dpll_device_get_by_clock_id(clock_id,
>
>I have to say I'm a bit lost in this code. Why exactly do you need this
>here? Looks like the pointer was set in ice_dpll_init_dpll().
>
>Or, is that in case of a different PF instantiating the DPLL instances?

Yes it is, different PF is attaching recovered clock pins with this.

>If yes, I'm pretty sure what it is wrong. What is the PF which did
>instanticate those unbinds? You have to share the dpll instance,
>refcount it.
>

It will break, as in our case only one designated PF controls the dpll.

>Btw, you have a problem during init as well, as the order matters. What
>if the other function probes only after executing this? You got -EFAULT
>here and bail out.
>

We don't expect such use case, altough I see your point, will try to fix it=
.

>In mlx5, I also share one dpll instance between 2 PFs. What I do is I
>create mlx5-dpll instance which is refcounted, created by first probed
>PF and removed by the last one. In mlx5 case, the PFs are equal, nobody
>is an owner of the dpll. In your case, I think it is different. So
>probably better to implement the logic in driver then in the dpll core.
>

For this NIC only one PF will control the dpll, so there is a designated ow=
ner.
Here owner must not only initialize a dpll but also register its pin,
so the other PFs could register additional pins. Basically it means
for ice that we can only rely on some postponed rclk initialization for
a case of unordered PF initialization. Seems doable.

>Then you don't need dpll_device_get_by_clock_id at all. If you decide to
>implement that in dpll core, I believe that there should be some
>functions like:
>dpll =3D dpll_device_get(ops, clock_id, ...)  - to create/get reference
>dpll_device_put(dpll)                       - to put reference/destroy

Sure, we can rename "dpll_device_get_by_clock_id" to "dpll_device_get" (as
it is only function currently exported for such behavior), and add
"dpll_device_put", with ref counts as suggested.

>
>First caller of dpll_device_get() actually makes dpll to instantiate the
>device.
>

Maybe I am missing something.. do you suggest that "dpll_device_get" would
allocate dpll device and do ref count, and then dpll_device_register(..) ca=
ll
would assign all the arguments that are available only in the owner instanc=
e?
Or i got it wrong?

>
>
>>+							 DPLL_TYPE_EEC, 0);
>>+	if (!pf->dplls.eec.dpll)
>>+		return -EFAULT;
>>+	pf->dplls.pps.dpll =3D dpll_device_get_by_clock_id(clock_id,
>>+							 DPLL_TYPE_PPS, 0);
>>+	if (!pf->dplls.pps.dpll)
>>+		return -EFAULT;
>>+
>>+	return 0;
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_parent_pins_init - initialize the recovered clock paren=
t
>>pins
>>+ * @pf: board private structure
>>+ * @base_rclk_idx: number of first recovered clock pin in DPLL
>>+ *
>>+ * This function shall be executed only if ICE_FLAG_DPLL feature is not
>
>Feature? It's a flag.
>

Sure, will fix.

Thanks,
Arkadiusz

>
>>+ * supported.
>>+ *
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - init failure
>>+ */
>>+static int ice_dpll_rclk_parent_pins_init(struct ice_pf *pf, u8
>>base_rclk_idx)
>>+{
>>+	int i;
>>+
>>+	if (pf->dplls.inputs)
>>+		return -EINVAL;
>>+	pf->dplls.inputs =3D kcalloc(pf->dplls.num_rclk,
>>+				   sizeof(*pf->dplls.inputs), GFP_KERNEL);
>>+
>>+	for (i =3D ICE_RCLKA_PIN; i < pf->dplls.num_rclk; i++) {
>>+		const char *desc;
>>+
>>+		desc =3D ice_cgu_get_pin_name(&pf->hw, base_rclk_idx + i, true);
>>+		if (!desc)
>>+			return -EINVAL;
>>+		pf->dplls.inputs[i].name =3D desc;
>>+	}
>>+	return 0;
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_init - Enable support for DPLL's PHY clock recovery
>>+ * @pf: board private structure
>>+ *
>>+ * Context:
>>+ * Acquires a pf->dplls.lock. If PF is not an owner of DPLL it shall fin=
d
>>and
>>+ * connect its pins with the device dpll.
>>+ *
>>+ * This function handles enablement of PHY clock recovery part for
>>timesync
>>+ * capabilities.
>>+ * Prepares and initalizes resources required to register its PHY clock
>sources
>>+ * within DPLL subsystem.
>>+ * Return:
>>+ * * 0 - success
>>+ * * negative - init failure
>>+ */
>>+int ice_dpll_rclk_init(struct ice_pf *pf)
>>+{
>>+	struct ice_dpll_pin *first_parent =3D NULL;
>>+	u8 base_rclk_idx;
>>+	int ret;
>>+
>>+	ret =3D ice_get_cgu_rclk_pin_info(&pf->hw, &base_rclk_idx,
>>+					&pf->dplls.num_rclk);
>>+	if (ret)
>>+		return ret;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	if (!test_bit(ICE_FLAG_DPLL, pf->flags)) {
>>+		ret =3D ice_dpll_rclk_find_dplls(pf);
>>+		dev_dbg(ice_pf_to_dev(pf), "ecc:%p, pps:%p\n",
>>+			pf->dplls.eec.dpll, pf->dplls.pps.dpll);
>>+		if (ret)
>>+			goto unlock;
>>+		ret =3D ice_dpll_rclk_parent_pins_init(pf, base_rclk_idx);
>>+		if (ret)
>>+			goto unlock;
>>+		first_parent =3D &pf->dplls.inputs[0];
>>+	} else {
>>+		first_parent =3D &pf->dplls.inputs[base_rclk_idx];
>>+	}
>>+	if (!first_parent) {
>>+		ret =3D -EFAULT;
>>+		goto unlock;
>>+	}
>>+	ret =3D ice_dpll_rclk_pins_init(pf, first_parent);
>>+unlock:
>>+	mutex_unlock(&pf->dplls.lock);
>>+	dev_dbg(ice_pf_to_dev(pf), "PHY RCLK init ret=3D%d\n", ret);
>>+
>>+	return ret;
>>+}
>>+
>>+/**
>>+ * ice_dpll_rclk_release - Disable the support for DPLL's PHY clock
>>recovery
>>+ * @pf: board private structure
>>+ *
>>+ * Context:
>>+ * Acquires a pf->dplls.lock. Requires dplls to be present, must be
>called
>>+ * before dplls are realesed.
>>+ *
>>+ * This function handles the cleanup work of resources allocated for
>>enablement
>>+ * of PHY recovery clock mechanics.
>>+ * Unregisters RCLK pins and frees pin's memory allocated by
>>ice_dpll_rclk_init.
>>+ */
>>+void ice_dpll_rclk_release(struct ice_pf *pf)
>>+{
>>+	int i, ret =3D 0;
>>+
>>+	if (!pf->dplls.rclk)
>>+		return;
>>+
>>+	mutex_lock(&pf->dplls.lock);
>>+	for (i =3D ICE_RCLKA_PIN; i < pf->dplls.num_rclk; i++) {
>>+		if (pf->dplls.rclk[i].pin) {
>>+			dpll_pin_deregister(pf->dplls.eec.dpll,
>>+					    pf->dplls.rclk[i].pin);
>>+			dpll_pin_deregister(pf->dplls.pps.dpll,
>>+					    pf->dplls.rclk[i].pin);
>>+			dpll_pin_free(pf->dplls.rclk[i].pin);
>>+			pf->dplls.rclk[i].pin =3D NULL;
>>+		}
>>+		kfree(pf->dplls.rclk[i].name);
>>+		pf->dplls.rclk[i].name =3D NULL;
>>+	}
>>+	/* inputs were prepared only for RCLK, release them here */
>>+	if (!test_bit(ICE_FLAG_DPLL, pf->flags)) {
>>+		kfree(pf->dplls.inputs);
>>+		pf->dplls.inputs =3D NULL;
>>+	}
>>+	kfree(pf->dplls.rclk);
>>+	pf->dplls.rclk =3D NULL;
>>+	mutex_unlock(&pf->dplls.lock);
>>+	dev_dbg(ice_pf_to_dev(pf), "PHY RCLK release ret:%d\n", ret);
>>+}
>>diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.h
>>b/drivers/net/ethernet/intel/ice/ice_dpll.h
>>new file mode 100644
>>index 000000000000..3390d60f2fab
>>--- /dev/null
>>+++ b/drivers/net/ethernet/intel/ice/ice_dpll.h
>>@@ -0,0 +1,99 @@
>>+/* SPDX-License-Identifier: GPL-2.0 */
>>+/* Copyright (C) 2022, Intel Corporation. */
>>+
>>+#ifndef _ICE_DPLL_H_
>>+#define _ICE_DPLL_H_
>>+
>>+#include "ice.h"
>>+
>>+#define ICE_DPLL_PRIO_MAX	0xF
>>+
>>+/** ice_dpll_pin - store info about pins
>>+ * @pin: dpll pin structure
>>+ * @flags: pin flags returned from HW
>>+ * @idx: ice pin private idx
>>+ * @type: type of a pin
>>+ * @signal_type: current signal type
>>+ * @signal_type_mask: signal types supported
>>+ * @freq: current frequency of a pin
>>+ * @mode_mask: current pin modes as bitmask
>>+ * @mode_supported_mask: supported pin modes
>>+ * @name: pin name
>>+ */
>>+struct ice_dpll_pin {
>>+	struct dpll_pin *pin;
>>+#define ICE_DPLL_RCLK_SOURCE_FLAG_EN	BIT(0)
>>+	u8 flags;
>>+	u8 idx;
>>+	enum dpll_pin_type type;
>>+	enum dpll_pin_signal_type signal_type;
>>+	unsigned long signal_type_mask;
>>+	u32 freq;
>>+	unsigned long mode_mask;
>>+	unsigned long mode_supported_mask;
>>+	const char *name;
>>+};
>>+
>>+/** ice_dpll - store info required for DPLL control
>>+ * @dpll: pointer to dpll dev
>>+ * @dpll_idx: index of dpll on the NIC
>>+ * @source_idx: source currently selected
>>+ * @prev_source_idx: source previously selected
>>+ * @ref_state: state of dpll reference signals
>>+ * @eec_mode: eec_mode dpll is configured for
>>+ * @phase_offset: phase delay of a dpll
>>+ * @input_prio: priorities of each input
>>+ * @dpll_state: current dpll sync state
>>+ * @prev_dpll_state: last dpll sync state
>>+ */
>>+struct ice_dpll {
>>+	struct dpll_device *dpll;
>>+	int dpll_idx;
>>+	u8 source_idx;
>>+	u8 prev_source_idx;
>>+	u8 ref_state;
>>+	u8 eec_mode;
>>+	s64 phase_offset;
>>+	u8 *input_prio;
>>+	enum ice_cgu_state dpll_state;
>>+	enum ice_cgu_state prev_dpll_state;
>>+};
>>+
>>+/** ice_dplls - store info required for CCU (clock controlling unit)
>>+ * @kworker: periodic worker
>>+ * @work: periodic work
>>+ * @lock: locks access to configuration of a dpll
>>+ * @eec: pointer to EEC dpll dev
>>+ * @pps: pointer to PPS dpll dev
>>+ * @inputs: input pins pointer
>>+ * @outputs: output pins pointer
>>+ * @rclk: recovered pins pointer
>>+ * @num_inputs: number of input pins available on dpll
>>+ * @num_outputs: number of output pins available on dpll
>>+ * @num_rclk: number of recovered clock pins available on dpll
>>+ * @cgu_state_acq_err_num: number of errors returned during periodic wor=
k
>>+ */
>>+struct ice_dplls {
>>+	struct kthread_worker *kworker;
>>+	struct kthread_delayed_work work;
>>+	struct mutex lock;
>>+	struct ice_dpll eec;
>>+	struct ice_dpll pps;
>>+	struct ice_dpll_pin *inputs;
>>+	struct ice_dpll_pin *outputs;
>>+	struct ice_dpll_pin *rclk;
>>+	u32 num_inputs;
>>+	u32 num_outputs;
>>+	u8 num_rclk;
>>+	int cgu_state_acq_err_num;
>>+};
>>+
>>+int ice_dpll_init(struct ice_pf *pf);
>>+
>>+void ice_dpll_release(struct ice_pf *pf);
>>+
>>+int ice_dpll_rclk_init(struct ice_pf *pf);
>>+
>>+void ice_dpll_rclk_release(struct ice_pf *pf);
>>+
>>+#endif
>>diff --git a/drivers/net/ethernet/intel/ice/ice_main.c
>>b/drivers/net/ethernet/intel/ice/ice_main.c
>>index a9a7f8b52140..8b65f4ad245e 100644
>>--- a/drivers/net/ethernet/intel/ice/ice_main.c
>>+++ b/drivers/net/ethernet/intel/ice/ice_main.c
>>@@ -4896,6 +4896,12 @@ ice_probe(struct pci_dev *pdev, const struct
>>pci_device_id __always_unused *ent)
>> 	if (test_bit(ICE_FLAG_PTP_SUPPORTED, pf->flags))
>> 		ice_ptp_init(pf);
>>
>>+	if (ice_is_feature_supported(pf, ICE_F_CGU))
>>+		ice_dpll_init(pf);
>>+
>>+	if (ice_is_feature_supported(pf, ICE_F_PHY_RCLK))
>>+		ice_dpll_rclk_init(pf);
>>+
>> 	if (ice_is_feature_supported(pf, ICE_F_GNSS))
>> 		ice_gnss_init(pf);
>>
>>@@ -5078,6 +5084,10 @@ static void ice_remove(struct pci_dev *pdev)
>> 		ice_ptp_release(pf);
>> 	if (ice_is_feature_supported(pf, ICE_F_GNSS))
>> 		ice_gnss_exit(pf);
>>+	if (ice_is_feature_supported(pf, ICE_F_PHY_RCLK))
>>+		ice_dpll_rclk_release(pf);
>>+	if (ice_is_feature_supported(pf, ICE_F_CGU))
>>+		ice_dpll_release(pf);
>> 	if (!ice_is_safe_mode(pf))
>> 		ice_remove_arfs(pf);
>> 	ice_setup_mc_magic_wake(pf);
>>--
>>2.30.2
>>
