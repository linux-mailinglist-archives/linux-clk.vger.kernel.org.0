Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD461025F5
	for <lists+linux-clk@lfdr.de>; Tue, 19 Nov 2019 15:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbfKSOIw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 19 Nov 2019 09:08:52 -0500
Received: from mail-eopbgr00045.outbound.protection.outlook.com ([40.107.0.45]:9830
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727096AbfKSOIv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 Nov 2019 09:08:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQ5kmey8A3e/p9STo2ZXoHg5E03kxzpKlPNkpQ5e5VueDIf9m4FHUESdGkaJeCbuzRbVarCNAEMDPxw+CYljsVh5ST9mWaSqUKVGp5YZ4YW/b5KcejBKs35cHikZnJc6LH1lOcIUeu8OfOCB553BClbpf//mYe2CP1n288ouAK+bX33bXOqGj1TbEeo1LhBdwkuBNx7/JR1kqvVBTtHkUdrqLz6qOwfHWUn2OTM0yugn4j2DN7Qe77WiY1sn2WNE/gre9uyqFLqm3qZlubCPFTpGSIUl+tHIOAznVnHpDSoI5+1T9ZWfYPenabWidFRT0D1OY301zYkc+jSEuJpj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy+aFYYOIvK6NjZv7nkbzPLZaQOCpfL2vOxf5JnCooc=;
 b=AcUk5t4n8Ufnl5hlg15fiaLHsriYknhs5W2zXHbJPClHz7F3t3bZChrc0KXfjAMHxGbQaTlwR0VkAh2LB2t/nr2x3QRyEhWp7poAWKLlxJrFWTN9qdp3sEc9ik7d3/gw4TLlMLq0c18eZsd5WCr+BG/EepZ9UrEn/SIlMSh6EEmN0GNitfDG8dRM1fez+Pya+L4uU8Hb5LyfhlTz0HGFalCEqYPqcc0At+MBg9cZRO5uriPdD6llJnb1LfRAK4IZB/lMf/k2wNK1dJbkCe/0Vt0+ZAfh1kjH3jIUVhbgwfC2s7L6aaYY8hZYKLJJdz8JUC8kenI49Ojf4WJi6OHIIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy+aFYYOIvK6NjZv7nkbzPLZaQOCpfL2vOxf5JnCooc=;
 b=At4gKFg70KeyY5DPSY6YkKDlYkgsiP3K8PYFJmhAQ2PxoWtoz0Hr/hAIXq8cC0NFzdZMahq1EJrpM9qdHP4oc4MQTPHNHtC4P9VMpAgo5Ippi/25kELnNYovG+/SlOSSE/ifzv1VXZonui3y9/IDJmP5nUBPhMFt9hlkghZtAnM=
Received: from AM0PR04MB5779.eurprd04.prod.outlook.com (20.178.202.151) by
 AM0PR04MB5428.eurprd04.prod.outlook.com (20.178.113.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 19 Nov 2019 14:08:43 +0000
Received: from AM0PR04MB5779.eurprd04.prod.outlook.com
 ([fe80::fd44:1b14:587c:9fde]) by AM0PR04MB5779.eurprd04.prod.outlook.com
 ([fe80::fd44:1b14:587c:9fde%7]) with mapi id 15.20.2451.029; Tue, 19 Nov 2019
 14:08:43 +0000
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>
CC:     Peng Fan <peng.fan@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH 5/9] clk: imx: Rename sccg and frac pll register to suggest
 clk_hw
Thread-Topic: [PATCH 5/9] clk: imx: Rename sccg and frac pll register to
 suggest clk_hw
Thread-Index: AQHVnuLZ7WelicdlBEiLSOICopm0eA==
Date:   Tue, 19 Nov 2019 14:08:43 +0000
Message-ID: <1574172496-12987-6-git-send-email-abel.vesa@nxp.com>
References: <1574172496-12987-1-git-send-email-abel.vesa@nxp.com>
In-Reply-To: <1574172496-12987-1-git-send-email-abel.vesa@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR04CA0026.eurprd04.prod.outlook.com
 (2603:10a6:208:122::39) To AM0PR04MB5779.eurprd04.prod.outlook.com
 (2603:10a6:208:131::23)
x-originating-ip: [89.37.124.34]
x-mailer: git-send-email 2.7.4
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abel.vesa@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5161274a-2ae8-4730-baeb-08d76cf9fc30
x-ms-traffictypediagnostic: AM0PR04MB5428:|AM0PR04MB5428:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB54285D08B441D148681D311EF64C0@AM0PR04MB5428.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(110136005)(256004)(86362001)(316002)(66446008)(66556008)(66476007)(64756008)(66946007)(36756003)(446003)(7736002)(305945005)(186003)(3846002)(6116002)(26005)(5660300002)(478600001)(52116002)(76176011)(99286004)(2616005)(66066001)(54906003)(2906002)(11346002)(6506007)(476003)(44832011)(386003)(6636002)(486006)(6486002)(102836004)(25786009)(8936002)(71200400001)(81156014)(81166006)(71190400001)(50226002)(6512007)(4326008)(6436002)(8676002)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5428;H:AM0PR04MB5779.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LMOuvhO+gvVjVqpNVPOj05z9t/Gu0eX3U/04JXzx6ozdUdg6PAQW17azJXduaONb7qPP0BahwjqQZQx8bl2olcWJ1I2V2yIP3mRvTBrvg8mM3/IfG9YduHuUCfd6ntgMIKfMic75tMV5nuNhQBQuhRgMGhugup2HtHHcDe4u8XxefpOfkZwNAJC9p1+xeNPTU9RTMDhWHPI6S47En5J5trHCyZzet1Gq+UvLBWqd7cNMWvOb8qmbLo2CMNs1cjBOKJGtUhPkDYE/v3EvtJPUwtSm+SwwF4wSd1G/+Uo+9zmCj/t+LU3gRd33rxO+vskSSRXhiUyK0+MfhrBIIImK1T4Ehyy1Oz5JahXZo3OtjX0nN64FPwPaJZfUOMlYP/YtjSrZ+F2qCqEk7NKpdN8JnE+VEwZKY/8mk7ulsMjSDj1i1UkY6VHyZ8PGMnkO2YZf
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5161274a-2ae8-4730-baeb-08d76cf9fc30
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 14:08:43.1732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7ruQhEPaN2TPMqoZWFPdbiAoQ776j6DCjJkLwSMOluvXFEY04jsU6FrJYCJ2jgAVT0z7jxwa+Ytt75JNFYOmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5428
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Renaming the imx_clk_frac_pll and imx_clk_sccg_pll register functions to
imx_clk_hw_frac_pll, respectively imx_clk_hw_sccg_pll to be more obvious
that they are clk_hw based.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/imx/clk-frac-pll.c |  7 ++++---
 drivers/clk/imx/clk-sccg-pll.c |  4 ++--
 drivers/clk/imx/clk.h          | 12 ++++++++++--
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/imx/clk-frac-pll.c b/drivers/clk/imx/clk-frac-pll.=
c
index fece503..101e0a3 100644
--- a/drivers/clk/imx/clk-frac-pll.c
+++ b/drivers/clk/imx/clk-frac-pll.c
@@ -201,8 +201,9 @@ static const struct clk_ops clk_frac_pll_ops =3D {
 	.set_rate	=3D clk_pll_set_rate,
 };
=20
-struct clk *imx_clk_frac_pll(const char *name, const char *parent_name,
-			     void __iomem *base)
+struct clk_hw *imx_clk_hw_frac_pll(const char *name,
+				   const char *parent_name,
+				   void __iomem *base)
 {
 	struct clk_init_data init;
 	struct clk_frac_pll *pll;
@@ -230,5 +231,5 @@ struct clk *imx_clk_frac_pll(const char *name, const ch=
ar *parent_name,
 		return ERR_PTR(ret);
 	}
=20
-	return hw->clk;
+	return hw;
 }
diff --git a/drivers/clk/imx/clk-sccg-pll.c b/drivers/clk/imx/clk-sccg-pll.=
c
index 5d65f65..2cf8748 100644
--- a/drivers/clk/imx/clk-sccg-pll.c
+++ b/drivers/clk/imx/clk-sccg-pll.c
@@ -506,7 +506,7 @@ static const struct clk_ops clk_sccg_pll_ops =3D {
 	.determine_rate	=3D clk_sccg_pll_determine_rate,
 };
=20
-struct clk *imx_clk_sccg_pll(const char *name,
+struct clk_hw *imx_clk_hw_sccg_pll(const char *name,
 				const char * const *parent_names,
 				u8 num_parents,
 				u8 parent, u8 bypass1, u8 bypass2,
@@ -545,5 +545,5 @@ struct clk *imx_clk_sccg_pll(const char *name,
 		return ERR_PTR(ret);
 	}
=20
-	return hw->clk;
+	return hw;
 }
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 71b21ab..15c6f54 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -115,6 +115,14 @@ extern struct imx_pll14xx_clk imx_1443x_pll;
 #define imx_clk_pllv2(name, parent, base) \
 	imx_clk_hw_pllv2(name, parent, base)->clk
=20
+#define imx_clk_frac_pll(name, parent_name, base) \
+	imx_clk_hw_frac_pll(name, parent_name, base)->clk
+
+#define imx_clk_sccg_pll(name, parent_names, num_parents, parent,\
+				bypass1, bypass2, base, flags) \
+	imx_clk_hw_sccg_pll(name, parent_names, num_parents, parent,\
+				bypass1, bypass2, base, flags)->clk \
+
 struct clk *imx_clk_pll14xx(const char *name, const char *parent_name,
 		 void __iomem *base, const struct imx_pll14xx_clk *pll_clk);
=20
@@ -124,10 +132,10 @@ struct clk_hw *imx_clk_hw_pllv1(enum imx_pllv1_type t=
ype, const char *name,
 struct clk_hw *imx_clk_hw_pllv2(const char *name, const char *parent,
 		void __iomem *base);
=20
-struct clk *imx_clk_frac_pll(const char *name, const char *parent_name,
+struct clk_hw *imx_clk_hw_frac_pll(const char *name, const char *parent_na=
me,
 			     void __iomem *base);
=20
-struct clk *imx_clk_sccg_pll(const char *name,
+struct clk_hw *imx_clk_hw_sccg_pll(const char *name,
 				const char * const *parent_names,
 				u8 num_parents,
 				u8 parent, u8 bypass1, u8 bypass2,
--=20
2.7.4

