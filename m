Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03C61102684
	for <lists+linux-clk@lfdr.de>; Tue, 19 Nov 2019 15:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfKSOXN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 19 Nov 2019 09:23:13 -0500
Received: from mail-eopbgr150045.outbound.protection.outlook.com ([40.107.15.45]:43395
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727591AbfKSOXN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 Nov 2019 09:23:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z16MQpngPxMFHoO0odhtBTwuTuWJE6wX/VjFQHJoyulnAyegPHg1uOJ2wpgmdxPrElxiJtmIui0WCL0NbzLFRDj3u9pVKutb9tfeqwqx62WkmH4AvhQCvQB/7gkWZl2r13+TYM1hv8b7WpALf8N9kz0xKytU1Aq/rKNJFbmyCjWMDnRbxSA0I/axDsBae1Fzja+6uHxeVaRyKHsKlbVM24Cpt2ZGTo+HCkpWPbBVAOZINkQlE3qnhhGDCZaErdHlY0pNHykpWNhBJMmhX/dZkvHtRL0fgSwDbVNNISlp4oJONwpqLUT+eVWRdljP1tLkcAEqWiKCGW73sLQXKit/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNU8QEbfapupSItkrgJz1DMmFFjb+kppIelKG3J3Yxk=;
 b=ndp5Wtdjoe1VaIypPV+MhxnbjEtHD4wBaXPHc2DKaYVw1zMVBFP3r3kyugqHen0yWoKR4kau3P+Jv0eLvzEsGlkmCapA7fRrgX+UeCKe+ulL7Y5zd6PTULfXvTeFw6nUJhsjjktRQ8ZNQ0dPnaucHb5nChjPUHpB5YrbG42RjwUXkniT2U6fPbZtMyxTDluepeM4gCIi0fCpPXa2srtpch/ZmBN9vTZUGWPv4cm3A/MKrCJvtKY4wHrLQa7KSpOt1ZhUJSCoo86UgTlvmohlhA6CWHvdysSehyQQY1+nxA0zYdF6gvm2WPFemLh4aE88shWYQ1V1AXpYpFk08FzCkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNU8QEbfapupSItkrgJz1DMmFFjb+kppIelKG3J3Yxk=;
 b=rHzICrb/dAmigPkJ4pf1rTIxR42unoTqivI23utQgLAuZL+3vb+j3bW+clAxMxUNDT2uyDMQojsge3m/LSg7r/4LnTTFyxqwTahUGLsw1yl6mcjP7ej048vpBHbC5WPtu3KQJKtiNsD1bz7qbcRMRApT7hkO0g+ahOsYrmPYlBo=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB6781.eurprd04.prod.outlook.com (10.255.196.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 19 Nov 2019 14:23:08 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::dd0c:72dc:e462:16b3]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::dd0c:72dc:e462:16b3%5]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 14:23:08 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
CC:     Shawn Guo <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH] clk: imx8m: Suppress bind attrs
Thread-Topic: [PATCH] clk: imx8m: Suppress bind attrs
Thread-Index: AQHVnl98s0A3/PZSfkCRDCZZIuiCLA==
Date:   Tue, 19 Nov 2019 14:23:08 +0000
Message-ID: <VI1PR04MB7023B7A97632610366549CA9EE4C0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <9f2ac65bab203a943de947465d6534980585e144.1574116045.git.leonard.crestez@nxp.com>
 <20191119070937.bcvezx5mwkqqymfo@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5db26460-541b-4b50-3172-08d76cfbffef
x-ms-traffictypediagnostic: VI1PR04MB6781:|VI1PR04MB6781:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6781930DE291FC8E00F08C7EEE4C0@VI1PR04MB6781.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:541;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(189003)(199004)(186003)(102836004)(26005)(25786009)(81156014)(9686003)(81166006)(8936002)(44832011)(8676002)(229853002)(6436002)(86362001)(66476007)(66556008)(6116002)(110136005)(55016002)(316002)(3846002)(54906003)(66946007)(5660300002)(64756008)(66446008)(52536014)(2906002)(486006)(99286004)(91956017)(76116006)(6246003)(476003)(7696005)(6506007)(4326008)(33656002)(53546011)(76176011)(7736002)(14454004)(74316002)(305945005)(4001150100001)(256004)(66066001)(71190400001)(71200400001)(478600001)(446003)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6781;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h27A3ftJ3mR5u9+9mYq1i8+NGCi29UUGM1zguehQu+cTf0ZVDO2k6bTB4HHjeQP/c9rWpBHTuV8mTjdxhwCXW1qvNEGm0DCAvKVmCr8e8vcgycukVdWHJbJfh7wqsWtuyPHXFFSKHQliqYVpyCvf65swaPH/GutHLO2jxzxJH0p6dND0or46JIQ7ZKcVHt6Gm9MP8z+5v3SilSAL8kFsR3Sydg0PCFJt5LEdbuQYfz5U/5sP75aW7wS+nUo9VN3Ync2LT/bbpV14Ko8522H0V4E/wVjMHYghbh9dhg9t+slRByU2MUhBIB9WNM6bScxhQox9CqsQ6m3lTq2anC7RsG9jBzjVOR/Pxc2e53WLqhVRR5ORxWaNzoQZJuascFiBRzmBhcTSTDoNGqlO+QegWrn+UXjpgPH+PVCXj7smTkr5YMWsxm3ytiyRvcfnML0O
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db26460-541b-4b50-3172-08d76cfbffef
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 14:23:08.1516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LLrl7Olfll2DD/0Fh9rWnHLpDtzeLw6O+aWZV7AddBMwRVVhfF9Jm5vRVoFhazelovVAt3m0fGkZejVHgcMIyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6781
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2019-11-19 9:09 AM, Uwe Kleine-K=F6nig wrote:=0A=
> On Tue, Nov 19, 2019 at 12:28:16AM +0200, Leonard Crestez wrote:=0A=
>> The clock drivers on imx8m series are registered as platform devices and=
=0A=
>> this opens the possibility of reloading the driver at runtime:=0A=
>>=0A=
>> This doesn't actually work: clocks are never removed and attempting to=
=0A=
>> bind again results in registration errors and a crash.=0A=
>>=0A=
>> Fix this by explicitly suppressing bind attrs like several other=0A=
>> drivers.=0A=
>>=0A=
>> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>=0A=
>>=0A=
>> ---=0A=
>> No cc: stable because because there are likely many other opportunities=
=0A=
>> to crash the system by echoing random stuff in sysfs as root.=0A=
>>=0A=
>>   drivers/clk/imx/clk-imx8mm.c | 1 +=0A=
>>   drivers/clk/imx/clk-imx8mn.c | 1 +=0A=
>>   drivers/clk/imx/clk-imx8mq.c | 1 +=0A=
>>   3 files changed, 3 insertions(+)=0A=
>>=0A=
>> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c=
=0A=
>> index 9246e89bb5fd..3cb75ad4270d 100644=0A=
>> --- a/drivers/clk/imx/clk-imx8mm.c=0A=
>> +++ b/drivers/clk/imx/clk-imx8mm.c=0A=
>> @@ -619,9 +619,10 @@ MODULE_DEVICE_TABLE(of, imx8mm_clk_of_match);=0A=
>>   =0A=
>>   static struct platform_driver imx8mm_clk_driver =3D {=0A=
>>   	.probe =3D imx8mm_clocks_probe,=0A=
>>   	.driver =3D {=0A=
>>   		.name =3D "imx8mm-ccm",=0A=
>> +		.suppress_bind_attrs =3D true,=0A=
> =0A=
> Maybe add a comment similar to the motivation in the commit log here?=0A=
> (And of course in the other files, too.)=0A=
=0A=
Is it really useful to say "disable feature X because it doesn't work" =0A=
right before disabling the feature?=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
