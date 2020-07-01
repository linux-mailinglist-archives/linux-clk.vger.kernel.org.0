Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9B5210340
	for <lists+linux-clk@lfdr.de>; Wed,  1 Jul 2020 07:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgGAFO4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 1 Jul 2020 01:14:56 -0400
Received: from mail-am6eur05on2085.outbound.protection.outlook.com ([40.107.22.85]:35170
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725272AbgGAFOz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 1 Jul 2020 01:14:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwFVkPrb7cqfFgBfYgAHEYIMKA/BVCN1Bb6H2mteqLMpdATXjT7WzBjUfqmNzYSU0R45lK9cGiuK8i4UNRAW4sAqcLrsuemgOoDBB4Nf7xDdg9Yu6x79hOb5IoFQX+f/H4rOi3helCvCmeOCBHIohcE/6m2Qoq0ljNmqyCjGHbicfApMvbP2WabV5HKGchCQ6DFQ0sC6ncltlKu8o+lViiPqXb2fqHR6QOm0nH7p79577Gxs2jLKQ9tRjRu3qCerMN7isTjuVleQfZEbqUOWxSrc1DUT8vW8gXGqrCb3cnFhfTN2NgBBTq0v2PpTkFc3bR04TKC9PJMbUPD5g8MZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UqdaWzetjY+arKjn38QvpBY/iTDJmK8KL/yGp2I65I=;
 b=URcIALUlBAZXqNJ7Rt0q1jdCsdTt1OuvJVcpVRkxzVJ6SUtSoTEU+ZyV0h0ladK0xRnzEpCWWp+Hi2HqWKOmGBQjLRdw0wVZbJnRqktYP/pcDE3zehpzex5xvaEfWIDfcgIlV2X+pM1z1JE6kyF+L5vNe78DZRpOMUcIHe651x4RTUm2XJ9TGhKw2lDLF/kuB7BYdAy+CCZelf5qhWdcRxrxAtglYJ3BICiHfe/BgQfzdbpx/AL3d7eRtQviiM5u99KyD2mdfMMYvRus6lUkUYO6BjWo2sWcUaNhN/9CTxqcouP9ejCRU8xDw493xgC5ku7laMPPxGPOtHlBE1epeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UqdaWzetjY+arKjn38QvpBY/iTDJmK8KL/yGp2I65I=;
 b=XpV58NGrZWCXZlUI7ptzg3SvrNfOfMISEc5R66COMtMd0YrGT4OH+qqmbns/grU/CT+Wp4Z5B7YMAlDAjvDpLAK+Ob+RBQ6am5HWcfBdftu3kYM0euXCdhc25xAeUrpRGCnyulhyZQvikZ+sibufL6ArdnhEWnZcO56lpKxIPR4=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB6PR0401MB2536.eurprd04.prod.outlook.com (2603:10a6:4:36::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 05:14:50 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3131.030; Wed, 1 Jul 2020
 05:14:50 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Russell King - ARM Linux <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Stefan Agner <stefan.agner@toradex.com>,
        Peng Fan <peng.fan@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Andy Duan <fugang.duan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V3 02/10] init.h: Fix the __setup_param() macro for module
 build
Thread-Topic: [PATCH V3 02/10] init.h: Fix the __setup_param() macro for
 module build
Thread-Index: AQHWTdtegku2i+ERdU6EY9a3qfOcyajvdnIAgAABM5CAAAXKgIACsi5g
Date:   Wed, 1 Jul 2020 05:14:50 +0000
Message-ID: <DB3PR0402MB39166254A6F287DC0A8216F1F56C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1593410042-10598-1-git-send-email-Anson.Huang@nxp.com>
 <1593410042-10598-3-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a2ZL6_rV=2brNz=UDdji3mddF+1Nb6Ew+=n4j0-fNrCug@mail.gmail.com>
 <DB3PR0402MB3916BA91E0F44EA5DAD6BF26F56E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a3igMrRNa1oR=d=9A-YNAmb+LXNRbwBk9zuJZq5tfvr9Q@mail.gmail.com>
In-Reply-To: <CAK8P3a3igMrRNa1oR=d=9A-YNAmb+LXNRbwBk9zuJZq5tfvr9Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d2bbe681-59eb-4ccc-5dcd-08d81d7dae2b
x-ms-traffictypediagnostic: DB6PR0401MB2536:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB25361A7335824B59A09B5E22F56C0@DB6PR0401MB2536.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6JdJ11XsIiN4i/BSWzqNT3KeyG6v5xZAqn+iK/82l+NQHdtdqvIP9QVnT9YWRlzSu6Hw2hSMtG5ACJvamcmUgTy5JXVa9X7y2qR417WnNtFYpal07N1HtykZplKA12DpnOFlK2+ZGcWMnA3Qc9vGKJJbmd2PO//kgN0dZoMCVju8b0w32QniDNpfcOgT6/z6aJJSChJNw1FHY1md9sajWSc6lkl6wEWK0Uak+53KcffEsOap4M/GuxD4PZ9u4Bf4rjMFi6STIBevjVx70w6Apk/RathHQYj+oCGAVW+ltcP7tNgSVdx04kVsO9nQDlzqIZ9fa59gAWD9kgOlqBPt6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(316002)(5660300002)(66556008)(64756008)(54906003)(66476007)(4326008)(66446008)(76116006)(71200400001)(44832011)(186003)(83380400001)(2906002)(55016002)(9686003)(8936002)(478600001)(26005)(53546011)(6506007)(7696005)(52536014)(8676002)(7416002)(66946007)(86362001)(33656002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: SdqcXlCHzQPANNHTuJiK2OVL3RZL5c8Q20JW8zNrWN4opDCgtaOtzMHj2O8mWr5CzmEzU0EY20BotBYcmehx615+3C6hYT4SokvKw+Uz0yYbjpzoZs/p8hM6xHoeKo0NFIb7An9LT7Jj+MAE6H7aXrQDkM9rOrnVsR136IiLtGLYtzJJRk7sCQxLX76iKjk+MB5UX10zUgqIpLy684uzPNKetREXOdm9HJoMwaiM0E844KDkr27KMTtpI8b2d/omkX7FTSV6OnN1MPAlyUEkPphXIIhFnkYfJ+7fQtzwfzGAfI6pTgaEO10E31ksoj8jzqoOPh2HS0qLHxMr8F82KWn54c8hmYw22UydTqfNLDuwaqkxxzyIOGE9n9zDEs9EeAkbQMcT+ydhX5COqtNiy0SVBWDd7+t+lg8Bdsty7efXRZ1WMpzZyym0QKexLDf32DFpUuIQiUnXHFME9dM2LVim1bWmxa/kgiO3Zm/nxfA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bbe681-59eb-4ccc-5dcd-08d81d7dae2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 05:14:50.2130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KdPPzkO3fDjgrj+ltVGYWhqh2K0zdCl683pGhs5Ni3tWVgSDXNTw9q+50H5KyDiRPSIZrbIgtyXMnlwyAwot+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2536
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGksIEFybmQNCg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMDIvMTBdIGluaXQuaDogRml4
IHRoZSBfX3NldHVwX3BhcmFtKCkgbWFjcm8gZm9yDQo+IG1vZHVsZSBidWlsZA0KPiANCj4gT24g
TW9uLCBKdW4gMjksIDIwMjAgYXQgMTo0MCBQTSBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhw
LmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIFYzIDAyLzEwXSBpbml0
Lmg6IEZpeCB0aGUgX19zZXR1cF9wYXJhbSgpIG1hY3JvDQo+ID4gPiBmb3IgbW9kdWxlIGJ1aWxk
DQo+ID4gPg0KPiA+ID4gT24gTW9uLCBKdW4gMjksIDIwMjAgYXQgODowNiBBTSBBbnNvbiBIdWFu
ZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBL
ZWVwIF9fc2V0dXBfcGFyYW0oKSB0byB1c2Ugc2FtZSBwYXJhbWV0ZXJzIGZvciBib3RoIGJ1aWx0
IGluIGFuZA0KPiA+ID4gPiBidWlsdCBhcyBtb2R1bGUsIGl0IGNhbiBtYWtlIHRoZSBkcml2ZXJz
IHdoaWNoIGNhbGwgaXQgZWFzaWVyIHdoZW4NCj4gPiA+ID4gdGhlIGRyaXZlcnMgY2FuIGJlIGJ1
aWx0IGluIG9yIGJ1aWx0IGFzIG1vZHVsZS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gPg0KPiA+ID4gSSB3b25k
ZXIgaWYgd2Ugc2hvdWxkIGluc3RlYWQgZHJvcCB0aGUgX19zZXR1cCgpIGFuZCBfX3NldHVwX3Bh
cmFtKCkNCj4gPiA+IGRlZmluaXRpb25zIGZyb20gdGhlICNlbHNlIGJsb2NrIGhlcmUuIFRoaXMg
d2FzIGNsZWFybHkgbm90IHVzZWQNCj4gPiA+IGFueXdoZXJlLCBhbmQgaXQgc291bmRzIGxpa2Ug
YW55IHBvc3NpYmxlIHVzZXIgaXMgYnJva2VuIGFuZCBzaG91bGQNCj4gPiA+IGJlIGNoYW5nZWQg
dG8gbm90IHVzZQ0KPiA+ID4gX19zZXR1cCgpIGFueXdheS4NCj4gPiA+DQo+ID4NCj4gPg0KPiA+
IEl0IG1ha2VzIHNlbnNlIHRvIGRyb3AgdGhlIF9fc2V0dXAoKSBhbmQgX19zZXJ1cF9wYXJhbSgp
IGluIHRoZSAjZWxzZQ0KPiA+IGJsb2NrLCBqdXN0IHVzZSBvbmUgZGVmaW5pdGlvbiBmb3IgYWxs
IGNhc2VzLCBpZiBubyBvbmUgb2JqZWN0cywgSSB3aWxsIHJlbW92ZQ0KPiB0aGVtIGluIG5leHQg
cGF0Y2ggc2VyaWVzLg0KPiANCj4gT2ssIHNvdW5kcyBnb29kLiBOb3RlIHRoYXQgdGhlcmUgbWF5
IGJlIHVzZXJzIG9mIHRoZSBwbGFpbiBfX3NldHVwKCkgdGhhdCBqdXN0DQo+IGdldCB0dXJuZWQg
aW50byBub3BzIHJpZ2h0IG5vdy4gVXN1YWxseSB0aG9zZSBhcmUgYWxyZWFkeSBlbmNsb3NlZCBp
biAiI2lmbmRlZg0KPiBNT0RVTEUiLCBidXQgaWYgdGhleSBhcmUgbm90LCB0aGVuIHJlbW92aW5n
IHRoZSBkZWZpbml0aW9uIHdvdWxkIGNhdXNlIGENCj4gYnVpbGQgZXJyb3IuDQo+IA0KPiBIYXZl
IGEgbG9vayBpZiB5b3UgY2FuIGZpbmQgc3VjaCBpbnN0YW5jZXMsIGFuZCBlaXRoZXIgY2hhbmdl
IHRoZSBwYXRjaCB0byBhZGQNCj4gdGhlIG1pc3NpbmcgIiNpZm5kZWYgTU9EVUxFIiBjaGVja3Ms
IG9yIGp1c3QgZHJvcCB0aGUgX19zZXR1cF9wYXJhbSgpIGFuZA0KPiBsZWF2ZSB0aGUgX19zZXR1
cCgpIGlmIGl0IGdldHMgdG9vIGNvbXBsaWNhdGVkLg0KDQpMb29rcyBsaWtlIHRoZSBfX3NldHVw
X3BhcmFtKCkgZGVmaW5lZCBpbiAiI2lmbmRlZiBNT0RVTEUiIGNhbiBOT1QgYmUgdXNlZCBmb3Ig
DQpNT0RVTEUgYnVpbGQgYXQgYWxsLCBzbyBzaGFyaW5nIHNhbWUgaW1wbGVtZW50YXRpb24gaXMg
Tk9UIGF2YWlsYWJsZSwgc28gaWYgaXQgaXMgTk9UDQp0aGF0IGNyaXRpY2FsLCBJIHBsYW4gdG8g
a2VlcCB0aGUgI2Vsc2UgYmxvY2sgaW4gdGhpcyBwYXRjaCwgbGV0IG1lIGtub3cgaWYgeW91IGhh
dmUgZnVydGhlcg0KY29uY2VybiBvciBhbnkgb3RoZXIgc3VnZ2VzdGlvbiwgYmVsb3cgaXMgdGhl
IGJ1aWxkIGVycm9yIHJlcG9ydGVkIGZvciBtb2R1bGUgYnVpbGQgdXNpbmcNCl9fc2V0dXBfcGFy
YW0oKSBpbXBsZW1lbnRhdGlvbiBmb3IgYnVpbHQgaW4uDQoNCnRoYW5rcywNCkFuc29uDQoNCg0K
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hbHRlcm5hdGl2
ZS5oOjEyLA0KICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9s
c2UuaDoxNSwNCiAgICAgICAgICAgICAgICAgZnJvbSAuL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
Y21weGNoZy5oOjE0LA0KICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC9hcm02NC9pbmNsdWRl
L2FzbS9hdG9taWMuaDoxNiwNCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgv
YXRvbWljLmg6NywNCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvYXNtLWdlbmVyaWMv
Yml0b3BzL2F0b21pYy5oOjUsDQogICAgICAgICAgICAgICAgIGZyb20gLi9hcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL2JpdG9wcy5oOjI2LA0KICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9s
aW51eC9iaXRvcHMuaDoyOSwNCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgv
a2VybmVsLmg6MTIsDQogICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2Nsay5o
OjEzLA0KICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvY2xrL2lteC9jbGsuYzoyOg0KLi9p
bmNsdWRlL2xpbnV4L2luaXQuaDoxNzc6MTY6IGVycm9yOiB2YXJpYWJsZSDigJhfX3NldHVwX2lt
eF9rZWVwX3VhcnRfZWFybHljb27igJkgaGFzIGluaXRpYWxpemVyIGJ1dCBpbmNvbXBsZXRlIHR5
cGUNCiAgMTc3IHwgIHN0YXRpYyBzdHJ1Y3Qgb2JzX2tlcm5lbF9wYXJhbSBfX3NldHVwXyMjdW5p
cXVlX2lkICBcDQogICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4NCmRyaXZl
cnMvY2xrL2lteC9jbGsuYzoxNTc6MTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9f
c2V0dXBfcGFyYW3igJkNCiAgMTU3IHwgX19zZXR1cF9wYXJhbSgiZWFybHljb24iLCBpbXhfa2Vl
cF91YXJ0X2Vhcmx5Y29uLA0KICAgICAgfCBefn5+fn5+fn5+fn5+DQouL2luY2x1ZGUvbGludXgv
aW5pdC5oOjE4MDo3OiB3YXJuaW5nOiBleGNlc3MgZWxlbWVudHMgaW4gc3RydWN0IGluaXRpYWxp
emVyDQogIDE4MCB8ICAgPSB7IF9fc2V0dXBfc3RyXyMjdW5pcXVlX2lkLCBmbiwgZWFybHkgfQ0K
ICAgICAgfCAgICAgICBefn5+fn5+fn5+fn4NCmRyaXZlcnMvY2xrL2lteC9jbGsuYzoxNTc6MTog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9fc2V0dXBfcGFyYW3igJkNCiAgMTU3IHwg
X19zZXR1cF9wYXJhbSgiZWFybHljb24iLCBpbXhfa2VlcF91YXJ0X2Vhcmx5Y29uLA0KICAgICAg
fCBefn5+fn5+fn5+fn5+DQouL2luY2x1ZGUvbGludXgvaW5pdC5oOjE4MDo3OiBub3RlOiAobmVh
ciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYX19zZXR1cF9pbXhfa2VlcF91YXJ0X2Vhcmx5Y29u4oCZ
KQ0KICAxODAgfCAgID0geyBfX3NldHVwX3N0cl8jI3VuaXF1ZV9pZCwgZm4sIGVhcmx5IH0NCiAg
ICAgIHwgICAgICAgXn5+fn5+fn5+fn5+DQpkcml2ZXJzL2Nsay9pbXgvY2xrLmM6MTU3OjE6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX3NldHVwX3BhcmFt4oCZDQogIDE1NyB8IF9f
c2V0dXBfcGFyYW0oImVhcmx5Y29uIiwgaW14X2tlZXBfdWFydF9lYXJseWNvbiwNCiAgICAgIHwg
Xn5+fn5+fn5+fn5+fg0KZHJpdmVycy9jbGsvaW14L2Nsay5jOjE1ODo4OiB3YXJuaW5nOiBleGNl
c3MgZWxlbWVudHMgaW4gc3RydWN0IGluaXRpYWxpemVyDQogIDE1OCB8ICAgICAgICBpbXhfa2Vl
cF91YXJ0X2Nsb2Nrc19wYXJhbSwgMCk7DQogICAgICB8ICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KLi9pbmNsdWRlL2xpbnV4L2luaXQuaDoxODA6MzI6IG5vdGU6IGluIGRlZmlu
aXRpb24gb2YgbWFjcm8g4oCYX19zZXR1cF9wYXJhbeKAmQ0KICAxODAgfCAgID0geyBfX3NldHVw
X3N0cl8jI3VuaXF1ZV9pZCwgZm4sIGVhcmx5IH0NCiAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+DQpkcml2ZXJzL2Nsay9pbXgvY2xrLmM6MTU4Ojg6IG5vdGU6IChuZWFy
IGluaXRpYWxpemF0aW9uIGZvciDigJhfX3NldHVwX2lteF9rZWVwX3VhcnRfZWFybHljb27igJkp
DQogIDE1OCB8ICAgICAgICBpbXhfa2VlcF91YXJ0X2Nsb2Nrc19wYXJhbSwgMCk7DQogICAgICB8
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KLi9pbmNsdWRlL2xpbnV4L2luaXQu
aDoxODA6MzI6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYX19zZXR1cF9wYXJhbeKA
mQ0KICAxODAgfCAgID0geyBfX3NldHVwX3N0cl8jI3VuaXF1ZV9pZCwgZm4sIGVhcmx5IH0NCiAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+DQpkcml2ZXJzL2Nsay9pbXgv
Y2xrLmM6MTU4OjM2OiB3YXJuaW5nOiBleGNlc3MgZWxlbWVudHMgaW4gc3RydWN0IGluaXRpYWxp
emVyDQogIDE1OCB8ICAgICAgICBpbXhfa2VlcF91YXJ0X2Nsb2Nrc19wYXJhbSwgMCk7DQogICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KLi9pbmNsdWRlL2xpbnV4
L2luaXQuaDoxODA6MzY6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYX19zZXR1cF9w
YXJhbeKAmQ0KICAxODAgfCAgID0geyBfX3NldHVwX3N0cl8jI3VuaXF1ZV9pZCwgZm4sIGVhcmx5
IH0NCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fg0KZHJp
dmVycy9jbGsvaW14L2Nsay5jOjE1ODozNjogbm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9y
IOKAmF9fc2V0dXBfaW14X2tlZXBfdWFydF9lYXJseWNvbuKAmSkNCiAgMTU4IHwgICAgICAgIGlt
eF9rZWVwX3VhcnRfY2xvY2tzX3BhcmFtLCAwKTsNCiAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeDQouL2luY2x1ZGUvbGludXgvaW5pdC5oOjE4MDozNjogbm90ZTog
aW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhfX3NldHVwX3BhcmFt4oCZDQogIDE4MCB8ICAgPSB7
IF9fc2V0dXBfc3RyXyMjdW5pcXVlX2lkLCBmbiwgZWFybHkgfQ0KICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+DQouL2luY2x1ZGUvbGludXgvaW5pdC5oOjE3
NzoxNjogZXJyb3I6IHZhcmlhYmxlIOKAmF9fc2V0dXBfaW14X2tlZXBfdWFydF9lYXJseXByaW50
a+KAmSBoYXMgaW5pdGlhbGl6ZXIgYnV0IGluY29tcGxldGUgdHlwZQ0KICAxNzcgfCAgc3RhdGlj
IHN0cnVjdCBvYnNfa2VybmVsX3BhcmFtIF9fc2V0dXBfIyN1bmlxdWVfaWQgIFwNCiAgICAgIHwg
ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fg0KZHJpdmVycy9jbGsvaW14L2Nsay5jOjE1
OToxOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX19zZXR1cF9wYXJhbeKAmQ0KICAx
NTkgfCBfX3NldHVwX3BhcmFtKCJlYXJseXByaW50ayIsIGlteF9rZWVwX3VhcnRfZWFybHlwcmlu
dGssDQogICAgICB8IF5+fn5+fn5+fn5+fn4NCi4vaW5jbHVkZS9saW51eC9pbml0Lmg6MTgwOjc6
IHdhcm5pbmc6IGV4Y2VzcyBlbGVtZW50cyBpbiBzdHJ1Y3QgaW5pdGlhbGl6ZXINCiAgMTgwIHwg
ICA9IHsgX19zZXR1cF9zdHJfIyN1bmlxdWVfaWQsIGZuLCBlYXJseSB9DQogICAgICB8ICAgICAg
IF5+fn5+fn5+fn5+fg0KZHJpdmVycy9jbGsvaW14L2Nsay5jOjE1OToxOiBub3RlOiBpbiBleHBh
bnNpb24gb2YgbWFjcm8g4oCYX19zZXR1cF9wYXJhbeKAmQ0KICAxNTkgfCBfX3NldHVwX3BhcmFt
KCJlYXJseXByaW50ayIsIGlteF9rZWVwX3VhcnRfZWFybHlwcmludGssDQogICAgICB8IF5+fn5+
fn5+fn5+fn4NCi4vaW5jbHVkZS9saW51eC9pbml0Lmg6MTgwOjc6IG5vdGU6IChuZWFyIGluaXRp
YWxpemF0aW9uIGZvciDigJhfX3NldHVwX2lteF9rZWVwX3VhcnRfZWFybHlwcmludGvigJkpDQog
IDE4MCB8ICAgPSB7IF9fc2V0dXBfc3RyXyMjdW5pcXVlX2lkLCBmbiwgZWFybHkgfQ0KICAgICAg
fCAgICAgICBefn5+fn5+fn5+fn4NCmRyaXZlcnMvY2xrL2lteC9jbGsuYzoxNTk6MTogbm90ZTog
aW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9fc2V0dXBfcGFyYW3igJkNCiAgMTU5IHwgX19zZXR1
cF9wYXJhbSgiZWFybHlwcmludGsiLCBpbXhfa2VlcF91YXJ0X2Vhcmx5cHJpbnRrLA0KICAgICAg
fCBefn5+fn5+fn5+fn5+DQpkcml2ZXJzL2Nsay9pbXgvY2xrLmM6MTYwOjg6IHdhcm5pbmc6IGV4
Y2VzcyBlbGVtZW50cyBpbiBzdHJ1Y3QgaW5pdGlhbGl6ZXINCiAgMTYwIHwgICAgICAgIGlteF9r
ZWVwX3VhcnRfY2xvY2tzX3BhcmFtLCAwKTsNCiAgICAgIHwgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+DQouL2luY2x1ZGUvbGludXgvaW5pdC5oOjE4MDozMjogbm90ZTogaW4gZGVm
aW5pdGlvbiBvZiBtYWNybyDigJhfX3NldHVwX3BhcmFt4oCZDQogIDE4MCB8ICAgPSB7IF9fc2V0
dXBfc3RyXyMjdW5pcXVlX2lkLCBmbiwgZWFybHkgfQ0KICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn4NCmRyaXZlcnMvY2xrL2lteC9jbGsuYzoxNjA6ODogbm90ZTogKG5l
YXIgaW5pdGlhbGl6YXRpb24gZm9yIOKAmF9fc2V0dXBfaW14X2tlZXBfdWFydF9lYXJseXByaW50
a+KAmSkNCiAgMTYwIHwgICAgICAgIGlteF9rZWVwX3VhcnRfY2xvY2tzX3BhcmFtLCAwKTsNCiAg
ICAgIHwgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQouL2luY2x1ZGUvbGludXgv
aW5pdC5oOjE4MDozMjogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhfX3NldHVwX3Bh
cmFt4oCZDQogIDE4MCB8ICAgPSB7IF9fc2V0dXBfc3RyXyMjdW5pcXVlX2lkLCBmbiwgZWFybHkg
fQ0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4NCmRyaXZlcnMvY2xr
L2lteC9jbGsuYzoxNjA6MzY6IHdhcm5pbmc6IGV4Y2VzcyBlbGVtZW50cyBpbiBzdHJ1Y3QgaW5p
dGlhbGl6ZXINCiAgMTYwIHwgICAgICAgIGlteF9rZWVwX3VhcnRfY2xvY2tzX3BhcmFtLCAwKTsN
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeDQouL2luY2x1ZGUv
bGludXgvaW5pdC5oOjE4MDozNjogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhfX3Nl
dHVwX3BhcmFt4oCZDQogIDE4MCB8ICAgPSB7IF9fc2V0dXBfc3RyXyMjdW5pcXVlX2lkLCBmbiwg
ZWFybHkgfQ0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
DQpkcml2ZXJzL2Nsay9pbXgvY2xrLmM6MTYwOjM2OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlv
biBmb3Ig4oCYX19zZXR1cF9pbXhfa2VlcF91YXJ0X2Vhcmx5cHJpbnRr4oCZKQ0KICAxNjAgfCAg
ICAgICAgaW14X2tlZXBfdWFydF9jbG9ja3NfcGFyYW0sIDApOw0KICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4NCi4vaW5jbHVkZS9saW51eC9pbml0Lmg6MTgwOjM2
OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmF9fc2V0dXBfcGFyYW3igJkNCiAgMTgw
IHwgICA9IHsgX19zZXR1cF9zdHJfIyN1bmlxdWVfaWQsIGZuLCBlYXJseSB9DQogICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn4NCi4vaW5jbHVkZS9saW51eC9p
bml0Lmg6MTc3OjMzOiBlcnJvcjogc3RvcmFnZSBzaXplIG9mIOKAmF9fc2V0dXBfaW14X2tlZXBf
dWFydF9lYXJseWNvbuKAmSBpc27igJl0IGtub3duDQogIDE3NyB8ICBzdGF0aWMgc3RydWN0IG9i
c19rZXJuZWxfcGFyYW0gX19zZXR1cF8jI3VuaXF1ZV9pZCAgXA0KICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+DQpkcml2ZXJzL2Nsay9pbXgvY2xrLmM6MTU3
OjE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX3NldHVwX3BhcmFt4oCZDQogIDE1
NyB8IF9fc2V0dXBfcGFyYW0oImVhcmx5Y29uIiwgaW14X2tlZXBfdWFydF9lYXJseWNvbiwNCiAg
ICAgIHwgXn5+fn5+fn5+fn5+fg0KLi9pbmNsdWRlL2xpbnV4L2luaXQuaDoxNzc6MzM6IGVycm9y
OiBzdG9yYWdlIHNpemUgb2Yg4oCYX19zZXR1cF9pbXhfa2VlcF91YXJ0X2Vhcmx5cHJpbnRr4oCZ
IGlzbuKAmXQga25vd24NCiAgMTc3IHwgIHN0YXRpYyBzdHJ1Y3Qgb2JzX2tlcm5lbF9wYXJhbSBf
X3NldHVwXyMjdW5pcXVlX2lkICBcDQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn4NCmRyaXZlcnMvY2xrL2lteC9jbGsuYzoxNTk6MTogbm90ZTogaW4gZXhw
YW5zaW9uIG9mIG1hY3JvIOKAmF9fc2V0dXBfcGFyYW3igJkNCiAgMTU5IHwgX19zZXR1cF9wYXJh
bSgiZWFybHlwcmludGsiLCBpbXhfa2VlcF91YXJ0X2Vhcmx5cHJpbnRrLA0KICAgICAgfCBefn5+
fn5+fn5+fn5+DQpzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI4MDogcmVjaXBlIGZvciB0YXJnZXQg
J2RyaXZlcnMvY2xrL2lteC9jbGsubycgZmFpbGVkDQoNCg==
