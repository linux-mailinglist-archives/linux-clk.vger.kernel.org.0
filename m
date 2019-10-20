Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1483BDDEE9
	for <lists+linux-clk@lfdr.de>; Sun, 20 Oct 2019 16:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfJTOlo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 20 Oct 2019 10:41:44 -0400
Received: from mail-eopbgr150071.outbound.protection.outlook.com ([40.107.15.71]:56194
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726349AbfJTOlo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 20 Oct 2019 10:41:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxUuiKzxv4E0SaQ+cyPx8cEYgkHZoPuzphnBGd0ng1wMVP1kLV9QS0N/11KEr1QE37N/A0B5C/BFmqIvZJPxAyj596esfLBL+RyOXEb12tW9QEBmmQoFW5VukfMScBe9qvU0R+BrvyYgHVNmx0gxn5umgnMHrTPL2Tmwmn5yHgV7Kuu2xLvuDJrTAL49wE63Z6JrHyDc00qBU8fMA6lwj2VILOGb4Tq8UdVXLnvkEAqKTLjBgmFNRHsahfpa2ToDouDU8hFFa73yYlOPHi9KllCh+oC0dKoQBV3cGlc0YEscZW5Z/dlXBVzpCNe7//0kMrOFdcWyalwUgmLt6TFEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qhDzeIgKgdCBzWf+SP0Y2TcJVhah/h+4Ks8vmqjX4s=;
 b=RlgomnBEdEkJ7FFwRdKUf47dom0KFR9Duovp+5D+/WHvIjPh44cKApqOyRkW7Q2GBOlN8/EHjMKfI2H6LS9sLN9Jk5CW4ULRAH8px18B6flQ5DrkM6JQScNmFGRD6DrEB6Bm5+uywOduzziPuSnna0UpZi+rvmtndp7K5+Ma5vglojBq1PRDfwK+2C4d9HNt5BjxD169iKlI6celmp4Fs0oR51h79GmNrIGYlTAFz+AQ6K7vFTocMQF0KRJDRk143Rtaac+L0OnN1qt74c+zyX+tH3MA0APqm7ZbPkLn4SA33HhPWE9BQG6ThpzO4o+wqtX1Ypsw/gQm+aHoXDh/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qhDzeIgKgdCBzWf+SP0Y2TcJVhah/h+4Ks8vmqjX4s=;
 b=Ea0eO3cn/deP883FNipV71ysezUXTHiMDyTHV3904M6+m/FLYxoLgrgkG79RDgGLQPLKYUuaQE2mgmsXVMkX5qzx2MEb3IIfk8cPKhYOZIBMACVXtOM+gdU+m4Kvgsdt9DW1uQq1zicskotm4UeU6aDyVhZgXFq+RK4B/EyFAMw=
Received: from AM0PR04MB5779.eurprd04.prod.outlook.com (20.178.202.151) by
 AM0PR04MB4644.eurprd04.prod.outlook.com (52.135.149.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Sun, 20 Oct 2019 14:41:37 +0000
Received: from AM0PR04MB5779.eurprd04.prod.outlook.com
 ([fe80::4122:fda5:e903:8c02]) by AM0PR04MB5779.eurprd04.prod.outlook.com
 ([fe80::4122:fda5:e903:8c02%3]) with mapi id 15.20.2347.028; Sun, 20 Oct 2019
 14:41:37 +0000
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Leonard Crestez <leonard.crestez@nxp.com>
CC:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 0/3] clk: imx8m: Define gates for pll1/2 dividers
Thread-Topic: [PATCH v3 0/3] clk: imx8m: Define gates for pll1/2 dividers
Thread-Index: AQHVhBjm9h4luDsJQEWJmMzVqbMlUadjoMAA
Date:   Sun, 20 Oct 2019 14:41:37 +0000
Message-ID: <20191020144136.7gavqzcrldwi2ff3@fsr-ub1664-175>
References: <cover.1571226979.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1571226979.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM7PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::17) To AM0PR04MB5779.eurprd04.prod.outlook.com
 (2603:10a6:208:131::23)
x-originating-ip: [89.37.124.34]
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abel.vesa@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: caeb289b-6fd7-4f01-483f-08d7556b9c96
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: AM0PR04MB4644:|AM0PR04MB4644:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4644927467EB596DA170D534F66E0@AM0PR04MB4644.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0196A226D1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(39860400002)(376002)(396003)(136003)(346002)(366004)(189003)(199004)(54906003)(14454004)(5024004)(256004)(486006)(6636002)(44832011)(2906002)(446003)(8676002)(305945005)(966005)(81166006)(81156014)(7736002)(11346002)(316002)(1076003)(478600001)(8936002)(99286004)(6116002)(3846002)(102836004)(86362001)(26005)(71190400001)(66446008)(64756008)(66556008)(66476007)(386003)(53546011)(6506007)(6486002)(6862004)(6436002)(66946007)(6246003)(25786009)(76176011)(5660300002)(71200400001)(52116002)(33716001)(66066001)(476003)(229853002)(6306002)(6512007)(186003)(9686003)(4326008)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4644;H:AM0PR04MB5779.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dehk5V2vDgRtfMREtuIdsMbT5Ue1L6HWiG4l55R2xijgCmEiBPKLWGQ9sO9ggoAiEDtGvF5b9PGuJf7+BdNa+yGijf1KjB4iAi5qKvnEX/SXg5B65OLMHx2SGvj0k17BflLAPdvZShpEdQ4nJDTlfJq2YNEp95V3/vdFxSr3Kcd3YQiJSKZuJv+dMMaSFWs+7ydQhWzcvHZFgU2aJFJsdI1UDyEub/i4tx3YMtt17uImJR5hn4rHCkRjnpcwwRsnTlStRTHLLjc8ISODlOK2fQ9LYEwpgQ3rvgnz7clMf1YxLuHFJbPaBWGtxsooS8wq1En3mKK+CSVcPyTz1KBUNX1jC6aHQ48auuOQOJH6+X90x1TMa+Za2fIH4migD75r/oxY27PZQYNgSRP4D4S4byH3sCBrue7y2OBk8N6/JzK8amjxfmCDG54lugYnQRXiPzDIzsiFMmXvHoiVJFz3UQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <41E43CCBFEAFDC4DBB349E3F56F5310E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caeb289b-6fd7-4f01-483f-08d7556b9c96
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2019 14:41:37.4759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MvNPlJ9f8KNLXS18bTXq3HtJT/yLvfmJNiZUvhmrLCBAY95ELeKQME9X1uM3qIWElwwe1QA7mZrkRXg89PYo2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4644
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19-10-16 11:57:36, Leonard Crestez wrote:
> The fixed dividers for sys_pll1 and sys_pll2 on imx8m each have a gate
> attached but they're currently unused so they default to "always on".
>=20
> Add them to the clk tree for the sake of corectness. This could expose
> bugs where parent clocks were not correctly enabled.
>=20
> The new gates are added between the PLL and fixed dividers and new gates
> are enumerated at the end in dt-bindings. This should ensure
> compatibility, even though none of these fixed dividers are directly
> referenced by peripherals anyway.
>=20
> There are small differences on imx8mq because the PLL physical
> implementation is also different.
>=20
> Changes since v2:
> * Rebased on top of next-20191015 which includes recent changes in
> shawnguo/clk/imx, solving conflict with commit f0b1d7f2e7c2 ("clk:
> imx8mq: Add VIDEO2_PLL clock")
> Link to v2: https://patchwork.kernel.org/cover/11177851/
>=20
> This was send with a different "email workaround", hopefully the patches
> look correct on your send. If they don't please let me know and I'll
> resend through another method
>=20
> Changes since v1:
> * Renumber 8mq 8mm clocks to avoid introducing gaps
> * Improve imx8mq commit message
> Link to v1: https://patchwork.kernel.org/cover/11141027/
>=20

For the entire series:

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> Leonard Crestez (3):
>   clk: imx8mq: Define gates for pll1/2 fixed dividers
>   clk: imx8mm: Define gates for pll1/2 fixed dividers
>   clk: imx8mn: Define gates for pll1/2 fixed dividers
>=20
>  drivers/clk/imx/clk-imx8mm.c             | 57 ++++++++++++++--------
>  drivers/clk/imx/clk-imx8mn.c             | 57 ++++++++++++++--------
>  drivers/clk/imx/clk-imx8mq.c             | 61 ++++++++++++++++--------
>  include/dt-bindings/clock/imx8mm-clock.h | 19 +++++++-
>  include/dt-bindings/clock/imx8mn-clock.h | 19 +++++++-
>  include/dt-bindings/clock/imx8mq-clock.h | 22 ++++++++-
>  6 files changed, 174 insertions(+), 61 deletions(-)
>=20
> --=20
> 2.17.1
>=20
