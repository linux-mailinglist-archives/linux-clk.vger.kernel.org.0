Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E58C105666
	for <lists+linux-clk@lfdr.de>; Thu, 21 Nov 2019 17:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfKUQE0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Nov 2019 11:04:26 -0500
Received: from mail-eopbgr150052.outbound.protection.outlook.com ([40.107.15.52]:23207
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726293AbfKUQEZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Nov 2019 11:04:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mc3VChlYcZheS/Unqe2E7HqMSrdNaSr3jU+ANVGnur6VzP9BnQD/GW8J7pKlv5h5doPM4MqV11JKNU2FCP3B+T367deeuH28U3KB6s1TduN6ZdC4XIxuQcNLFi11366aBqOMBTATiG/kRWLPwcKICEYIZF6GOuB1tNm1EmhuVVM6f616u6eqHA5l3Di7hd+cPb/0OVIeu/kXKDCMNMbmSwZewHUU0T5EE5MOXOBnJu2Mh/v3k66Bq2RZQvS8elaafDpKfVJ9JfmQ6ffjqLeGw8w1iY9vSydEqKRfGt7bQf39k1cufHAdgWQ4EQE4R4rjbVuNIpYsa1CzThfWfZgW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWGACuj3mRoeCOZYCao5r6sJTucir0tQC/xk9OT0ldw=;
 b=FLTUTrM+LXibETwy95p+HgS6Wh48S2MVeGyH0UUWfd3H9J20zjs08XOfExCzYgnL0ncw6HpRCWxzYTvoIqStmkc/wE96BkNci4j8q1cgm15tLBiehjtgXfSNGtPaWT8eCHa0In/TI8r60jt+ZJ1Xm3Fka+8g6QXu98gDjTqlDbndDUjbXNNnWUA/CDgOMlDm+kXsdbZw1STy/xrxOowR5eGGjTjZbpTAqdeVeEfW+EwmFwZfYg35943Lj5raY/WDi5jYgTcfh9EWAdCRC+Od2fxzJAxueB5ULj8RfJlwDXAGn7i0awPZPrMr/EMUnA/NWnIfTH2T3Mzb3d7NcXi0BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWGACuj3mRoeCOZYCao5r6sJTucir0tQC/xk9OT0ldw=;
 b=VeN84ZeBNMgfnCIsTkudlxC5F7FVZWWEzizM2ZMd3SsUW/WQSYEJ/tIk0nbimcqKxF+Ef8igkTHPpycmGdxCfcY2rNb6HU0qJaH+cDIFIRW1SEnBKkwTSx7/TOLjwmLM3x/bV6K6/+6e+Up28s+MBkHcapi5KqvPiKZHhq0SVXk=
Received: from DB7PR04MB5195.eurprd04.prod.outlook.com (20.176.236.27) by
 DB7PR04MB4795.eurprd04.prod.outlook.com (20.176.234.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Thu, 21 Nov 2019 16:04:14 +0000
Received: from DB7PR04MB5195.eurprd04.prod.outlook.com
 ([fe80::551e:2221:4f8d:a7b8]) by DB7PR04MB5195.eurprd04.prod.outlook.com
 ([fe80::551e:2221:4f8d:a7b8%5]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 16:04:14 +0000
From:   Wen He <wen.he_1@nxp.com>
To:     Michael Walle <michael@walle.cc>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Leo Li <leoyang.li@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: RE: [EXT] Re: [v9 2/2] clk: ls1028a: Add clock driver for Display
 output interface
Thread-Topic: [EXT] Re: [v9 2/2] clk: ls1028a: Add clock driver for Display
 output interface
Thread-Index: AQHVnrB+dCTFPZLDr0SNYkLHdzaE96eUIliAgAGY3HA=
Date:   Thu, 21 Nov 2019 16:04:14 +0000
Message-ID: <DB7PR04MB5195DE21552AE64DBA59CCFFE24E0@DB7PR04MB5195.eurprd04.prod.outlook.com>
References: <20191119080747.35250-2-wen.he_1@nxp.com>
 <b300cc0f4d8a2c5650abc847d76bc380@walle.cc>
In-Reply-To: <b300cc0f4d8a2c5650abc847d76bc380@walle.cc>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=wen.he_1@nxp.com; 
x-originating-ip: [223.72.55.53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6d94233b-7a62-40c2-c1d2-08d76e9c74bb
x-ms-traffictypediagnostic: DB7PR04MB4795:|DB7PR04MB4795:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4795AA5AF3F362F61C065B23E24E0@DB7PR04MB4795.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(13464003)(199004)(189003)(71200400001)(26005)(99286004)(446003)(11346002)(316002)(3846002)(25786009)(71190400001)(7696005)(33656002)(6116002)(6916009)(102836004)(30864003)(6246003)(54906003)(4326008)(6506007)(53546011)(256004)(76176011)(14444005)(66066001)(186003)(2906002)(66556008)(64756008)(66446008)(229853002)(76116006)(66476007)(86362001)(66946007)(9686003)(5660300002)(52536014)(55016002)(74316002)(305945005)(7736002)(8676002)(81156014)(81166006)(8936002)(6436002)(478600001)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4795;H:DB7PR04MB5195.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e3ZI2bf9SuQgzhPq6lJKO8JlBAR0b2pPt85yeevtt9cbBnJWZoxiyaBEpGMkbDaXiumV3ld1epKhIWjr0YiZjPS+aS6huMUkDBYrLCK9lLlIkSFmxROs4F+V5w/68WzI3xRNI5M6FRLPOlcFILOh2Dg/OPxiFHphy5vL6sNsI5hF7pt5IYxlSDwECzygLcTonfRK1wQeNz7DFLyygRFuGuuogsWinizq/gaoFrRnqTKEfCCnmCVrd1tm2ihA73HE5Cr9DEv7bqJ/c6mHASvxycdSlTv9c5WRipgdqEuD6z1UP5GQCWynYB1UMJY2PUxZfUBVZULiWph7Hmyf0nMy7jyhoj0tI0uXCRtExiovZP5xHgPRlU6WW/ElUcASdKFsfZ7OLPHgacB/t3NvKanhol+OSuOUj39BMCGJ9/LbTvizcVxLJ1jGzAhSuwkjCyk3
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d94233b-7a62-40c2-c1d2-08d76e9c74bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 16:04:14.5551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJ6ZokAdBdPZbJnXXqn2BLGffhD+2Nw54T5KrErgMeKAeCjQROYx0LksT7SaIdOrEDPzMS0Ab1VPTruDntNrEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4795
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWljaGFlbCBXYWxsZSA8
bWljaGFlbEB3YWxsZS5jYz4NCj4gU2VudDogMjAxOcTqMTHUwjIwyNUgMjI6MzYNCj4gVG86IFdl
biBIZSA8d2VuLmhlXzFAbnhwLmNvbT4NCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
OyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47DQo+IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IG1hcmsucnV0bGFuZEBhcm0uY29t
OyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgcm9iaCtkdEBrZXJuZWwub3JnOw0KPiBzYm95ZEBr
ZXJuZWwub3JnDQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbdjkgMi8yXSBjbGs6IGxzMTAyOGE6IEFk
ZCBjbG9jayBkcml2ZXIgZm9yIERpc3BsYXkgb3V0cHV0DQo+IGludGVyZmFjZQ0KPiANCj4gDQo+
IEhpLA0KDQpIaSBNaWNoYWVsLA0KDQo+IA0KPiA+IEFkZCBjbG9jayBkcml2ZXIgZm9yIFFvcklR
IExTMTAyOEEgRGlzcGxheSBvdXRwdXQgaW50ZXJmYWNlcyhMQ0QsDQo+ID4gRFBIWSksIGFzIGlt
cGxlbWVudGVkIGluIFRTTUMgQ0xOMjhIUE0gUExMLCB0aGlzIFBMTCBzdXBwb3J0cyB0aGUNCj4g
PiBwcm9ncmFtbWFibGUgaW50ZWdlciBkaXZpc2lvbiBhbmQgcmFuZ2Ugb2YgdGhlIGRpc3BsYXkg
b3V0cHV0IHBpeGVsDQo+ID4gY2xvY2sncyAyNy01OTRNSHouDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBXZW4gSGUgPHdlbi5oZV8xQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gY2hhbmdlIGluIHY5
Og0KPiA+ICAgICAgIC0gVXNlIHRoZSBmaXhlZCBtZmQgaW4gcGxsZGlnX3NldF9yYXRlDQo+ID4N
Cj4gPiAgZHJpdmVycy9jbGsvS2NvbmZpZyAgICAgIHwgIDEwICsrDQo+ID4gIGRyaXZlcnMvY2xr
L01ha2VmaWxlICAgICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvY2xrL2Nsay1wbGxkaWcuYyB8IDI5
Nw0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAzIGZp
bGVzIGNoYW5nZWQsIDMwOCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2Nsay9jbGstcGxsZGlnLmMNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9LY29uZmlnIGIvZHJpdmVycy9jbGsvS2NvbmZpZyBpbmRleA0KPiA+IDA1MzBiZWJmYzI1YS4u
OWY2YjAxOTZjNjA0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL0tjb25maWcNCj4gPiAr
KysgYi9kcml2ZXJzL2Nsay9LY29uZmlnDQo+ID4gQEAgLTIxOCw2ICsyMTgsMTYgQEAgY29uZmln
IENMS19RT1JJUQ0KPiA+ICAgICAgICAgVGhpcyBhZGRzIHRoZSBjbG9jayBkcml2ZXIgc3VwcG9y
dCBmb3IgRnJlZXNjYWxlIFFvcklRIHBsYXRmb3Jtcw0KPiA+ICAgICAgICAgdXNpbmcgY29tbW9u
IGNsb2NrIGZyYW1ld29yay4NCj4gPg0KPiA+ICtjb25maWcgQ0xLX0xTMTAyOEFfUExMRElHDQo+
ID4gKyAgICAgICAgdHJpc3RhdGUgIkNsb2NrIGRyaXZlciBmb3IgTFMxMDI4QSBEaXNwbGF5IG91
dHB1dCINCj4gPiArICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfTEFZRVJTQ0FQRSB8fCBDT01QSUxF
X1RFU1QNCj4gPiArICAgICAgICBkZWZhdWx0IEFSQ0hfTEFZRVJTQ0FQRQ0KPiA+ICsgICAgICAg
IGhlbHANCj4gPiArICAgICAgICAgIFRoaXMgZHJpdmVyIHN1cHBvcnQgdGhlIERpc3BsYXkgb3V0
cHV0IGludGVyZmFjZXMoTENELA0KPiA+ICtEUEhZKQ0KPiA+IHBpeGVsIGNsb2Nrcw0KPiA+ICsg
ICAgICAgICAgb2YgdGhlIFFvcklRIExheWVyc2NhcGUgTFMxMDI4QSwgYXMgaW1wbGVtZW50ZWQg
VFNNQw0KPiA+IENMTjI4SFBNIFBMTC4gTm90IGFsbA0KPiA+ICsgICAgICAgICAgZmVhdHVyZXMg
b2YgdGhlIFBMTCBhcmUgY3VycmVudGx5IHN1cHBvcnRlZCBieSB0aGUgZHJpdmVyLg0KPiA+IEJ5
IGRlZmF1bHQsDQo+ID4gKyAgICAgICAgICBjb25maWd1cmVkIGJ5cGFzcyBtb2RlIHdpdGggdGhp
cyBQTEwuDQo+ID4gKw0KPiA+ICBjb25maWcgQ09NTU9OX0NMS19YR0VORQ0KPiA+ICAgICAgIGJv
b2wgIkNsb2NrIGRyaXZlciBmb3IgQVBNIFhHZW5lIFNvQyINCj4gPiAgICAgICBkZWZhdWx0IEFS
Q0hfWEdFTkUNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvTWFrZWZpbGUgYi9kcml2ZXJz
L2Nsay9NYWtlZmlsZSBpbmRleA0KPiA+IDAxMzhmYjE0ZTZmOC4uOTdkMWU1YmM2ZGU1IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9jbGsv
TWFrZWZpbGUNCj4gPiBAQCAtNDMsNiArNDMsNyBAQCBvYmotJChDT05GSUdfQVJDSF9OUENNN1hY
KSAgICAgICAgICArPQ0KPiBjbGstbnBjbTd4eC5vDQo+ID4gIG9iai0kKENPTkZJR19BUkNIX05T
UElSRSkgICAgICAgICAgICArPSBjbGstbnNwaXJlLm8NCj4gPiAgb2JqLSQoQ09ORklHX0NPTU1P
Tl9DTEtfT1hOQVMpICAgICAgICAgICAgICAgKz0gY2xrLW94bmFzLm8NCj4gPiAgb2JqLSQoQ09O
RklHX0NPTU1PTl9DTEtfUEFMTUFTKSAgICAgICAgICAgICAgKz0gY2xrLXBhbG1hcy5vDQo+ID4g
K29iai0kKENPTkZJR19DTEtfTFMxMDI4QV9QTExESUcpICAgICArPSBjbGstcGxsZGlnLm8NCj4g
PiAgb2JqLSQoQ09ORklHX0NPTU1PTl9DTEtfUFdNKSAgICAgICAgICs9IGNsay1wd20ubw0KPiA+
ICBvYmotJChDT05GSUdfQ0xLX1FPUklRKSAgICAgICAgICAgICAgICAgICAgICArPSBjbGstcW9y
aXEubw0KPiA+ICBvYmotJChDT05GSUdfQ09NTU9OX0NMS19SSzgwOCkgICAgICAgICAgICAgICAr
PSBjbGstcms4MDgubw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstcGxsZGlnLmMg
Yi9kcml2ZXJzL2Nsay9jbGstcGxsZGlnLmMgbmV3DQo+ID4gZmlsZSBtb2RlIDEwMDY0NCBpbmRl
eCAwMDAwMDAwMDAwMDAuLmY5NDBhOWQzZDAxMQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9kcml2ZXJzL2Nsay9jbGstcGxsZGlnLmMNCj4gPiBAQCAtMCwwICsxLDI5NyBAQA0KPiA+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5
cmlnaHQgMjAxOSBOWFANCj4gPiArICoNCj4gPiArICogQ2xvY2sgZHJpdmVyIGZvciBMUzEwMjhB
IERpc3BsYXkgb3V0cHV0IGludGVyZmFjZXMoTENELCBEUEhZKS4NCj4gPiArICovDQo+ID4gKw0K
PiA+ICsjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9kZXZpY2UuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICsjaW5jbHVk
ZSA8bGludXgvZXJyLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9pby5oPg0KPiA+ICsjaW5jbHVk
ZSA8bGludXgvaW9wb2xsLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+ICsjaW5j
bHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNl
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gPiArI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+DQo+ID4g
Kw0KPiA+ICsvKiBQTExESUcgcmVnaXN0ZXIgb2Zmc2V0cyBhbmQgYml0IG1hc2tzICovDQo+ID4g
KyNkZWZpbmUgUExMRElHX1JFR19QTExTUiAgICAgICAgICAgIDB4MjQNCj4gPiArI2RlZmluZSBQ
TExESUdfUkVHX1BMTERWICAgICAgICAgICAgMHgyOA0KPiA+ICsjZGVmaW5lIFBMTERJR19SRUdf
UExMRk0gICAgICAgICAgICAweDJjDQo+ID4gKyNkZWZpbmUgUExMRElHX1JFR19QTExGRCAgICAg
ICAgICAgIDB4MzANCj4gPiArI2RlZmluZSBQTExESUdfUkVHX1BMTENBTDEgICAgICAgICAgMHgz
OA0KPiA+ICsjZGVmaW5lIFBMTERJR19SRUdfUExMQ0FMMiAgICAgICAgICAweDNjDQo+ID4gKyNk
ZWZpbmUgUExMRElHX0xPQ0tfTUFTSyAgICAgICAgICAgIEJJVCgyKQ0KPiA+ICsjZGVmaW5lIFBM
TERJR19SRUdfRklFTERfU1NDR0JZUCAgICBCSVQoMzApDQo+ID4gKyNkZWZpbmUgUExMRElHX1JF
R19GSUVMRF9GREVOICAgICAgIEJJVCgzMCkNCj4gPiArI2RlZmluZSBQTExESUdfUkVHX0ZJRUxE
X0RUSERJUyAgICAgR0VOTUFTSygxNywgMTYpDQo+ID4gKyNkZWZpbmUgUExMRElHX1JFR19GSUVM
RF9NVUxUICAgICAgIEdFTk1BU0soNywgMCkNCj4gPiArI2RlZmluZSBQTExESUdfUkVHX0ZJRUxE
X1JGRFBISTEgICAgR0VOTUFTSygzMCwgMjUpDQo+ID4gKw0KPiA+ICsvKiBNaW5pbXVtIG91dHB1
dCBjbG9jayBmcmVxdWVuY3ksIGluIEh6ICovICNkZWZpbmUgUEhJMV9NSU5fRlJFUQ0KPiA+ICsy
NzAwMDAwMA0KPiA+ICsNCj4gPiArLyogTWF4aW11bSBvdXRwdXQgY2xvY2sgZnJlcXVlbmN5LCBp
biBIeiAqLyAjZGVmaW5lIFBISTFfTUFYX0ZSRVENCj4gPiArNjAwMDAwMDAwDQo+ID4gKw0KPiA+
ICsvKiBNYXhpbXVtIG9mIHRoZSBkaXZpZGVyICovDQo+ID4gKyNkZWZpbmUgTUFYX1JGRFBISTEg
ICAgICAgICAgNjMNCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIENsb2NrIGNvbmZpZ3VyYXRpb24g
cmVsYXRpb25zaGlwIGJldHdlZW4gdGhlIFBISTENCj4gPiBmcmVxdWVuY3koZnBsbF9waGkpIGFu
ZA0KPiA+ICsgKiB0aGUgb3V0cHV0IGZyZXF1ZW5jeSBvZiB0aGUgUExMIGlzIGRldGVybWluZWQg
YnkgdGhlIFBMTERWLA0KPiA+IGFjY29yZGluZyB0bw0KPiA+ICsgKiB0aGUgZm9sbG93aW5nIGVx
dWF0aW9uOg0KPiA+ICsgKiBmcGxsX3BoaSA9IChwbGxfcmVmICogbWZkKSAvIGRpdl9yZmRwaGkx
ICAqLyBzdHJ1Y3QNCj4gPiArcGxsZGlnX3BoaTFfcGFyYW0gew0KPiA+ICsgICAgIHVuc2lnbmVk
IGxvbmcgcmF0ZTsNCj4gPiArICAgICB1bnNpZ25lZCBpbnQgcmZkcGhpMTsNCj4gPiArICAgICB1
bnNpZ25lZCBpbnQgbWZkOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBjbGtfcGFyZW50X2RhdGEgcGFyZW50X2RhdGFbXSA9IHsNCj4gPiArICAgICB7LmluZGV4ID0g
MH0sDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgY2xrX3BsbGRpZyB7DQo+ID4gKyAgICAg
c3RydWN0IGNsa19odyBodzsNCj4gPiArICAgICB2b2lkIF9faW9tZW0gKnJlZ3M7DQo+ID4gKyAg
ICAgdW5zaWduZWQgaW50IG1mZDsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyNkZWZpbmUgdG9fY2xr
X3BsbGRpZyhfaHcpICAgY29udGFpbmVyX29mKF9odywgc3RydWN0IGNsa19wbGxkaWcsIGh3KQ0K
PiA+ICsNCj4gPiArc3RhdGljIGludCBwbGxkaWdfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3KSB7
DQo+ID4gKyAgICAgc3RydWN0IGNsa19wbGxkaWcgKmRhdGEgPSB0b19jbGtfcGxsZGlnKGh3KTsN
Cj4gPiArICAgICB1MzIgdmFsOw0KPiA+ICsNCj4gPiArICAgICB2YWwgPSByZWFkbChkYXRhLT5y
ZWdzICsgUExMRElHX1JFR19QTExGTSk7DQo+ID4gKyAgICAgLyoNCj4gPiArICAgICAgKiBVc2Ug
QnlwYXNzIG1vZGUgd2l0aCBQTEwgb2ZmIGJ5IGRlZmF1bHQsIHRoZSBmcmVxdWVuY3kgb3ZlcnNo
b290DQo+ID4gKyAgICAgICogZGV0ZWN0b3Igb3V0cHV0IHdhcyBkaXNhYmxlLiBTU0NHIEJ5cGFz
cyBtb2RlIHNob3VsZCBiZSBlbmFibGUuDQo+ID4gKyAgICAgICovDQo+ID4gKyAgICAgdmFsIHw9
IFBMTERJR19SRUdfRklFTERfU1NDR0JZUDsNCj4gPiArICAgICB3cml0ZWwodmFsLCBkYXRhLT5y
ZWdzICsgUExMRElHX1JFR19QTExGTSk7DQo+ID4gKw0KPiA+ICsgICAgIHZhbCA9IHJlYWRsKGRh
dGEtPnJlZ3MgKyBQTExESUdfUkVHX1BMTEZEKTsNCj4gPiArICAgICAvKiBEaXNhYmxlIGRpdGhl
ciBhbmQgU2lnbWEgZGVsdGEgbW9kdWxhdGlvbiBpbiBieXBhc3MgbW9kZSAqLw0KPiA+ICsgICAg
IHZhbCB8PSBGSUVMRF9QUkVQKFBMTERJR19SRUdfRklFTERfRkRFTiwgMHgxKSB8DQo+IA0KPiBV
bmxpa2UgbWVudGlvbmVkIGluIHRoZSBkb2N1bWVudGF0aW9uLCBGREVOIGlzICJmcmFjdGlvbmFs
IGRpdmlkZXIgZW5hYmxlIi4NCj4gDQo+IA0KDQpZZXMsIHRoaXMgcG9pbnQganVzdCBjb25maXJt
ZWQgaW4geWVzdGVyZGF5Lg0KDQo+IA0KPiA+ICsgICAgICAgICAgICBGSUVMRF9QUkVQKFBMTERJ
R19SRUdfRklFTERfRFRIRElTLCAweDMpOw0KPiA+ICsNCj4gPiArICAgICB3cml0ZWwodmFsLCBk
YXRhLT5yZWdzICsgUExMRElHX1JFR19QTExGRCk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAw
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBwbGxkaWdfZGlzYWJsZShzdHJ1Y3Qg
Y2xrX2h3ICpodykgew0KPiA+ICsgICAgIHN0cnVjdCBjbGtfcGxsZGlnICpkYXRhID0gdG9fY2xr
X3BsbGRpZyhodyk7DQo+ID4gKyAgICAgdTMyIHZhbDsNCj4gPiArDQo+ID4gKyAgICAgdmFsID0g
cmVhZGwoZGF0YS0+cmVncyArIFBMTERJR19SRUdfUExMRk0pOw0KPiA+ICsNCj4gPiArICAgICB2
YWwgJj0gflBMTERJR19SRUdfRklFTERfU1NDR0JZUDsNCj4gPiArICAgICB2YWwgfD0gRklFTERf
UFJFUChQTExESUdfUkVHX0ZJRUxEX1NTQ0dCWVAsIDB4MCk7DQo+ID4gKw0KPiA+ICsgICAgIHdy
aXRlbCh2YWwsIGRhdGEtPnJlZ3MgKyBQTExESUdfUkVHX1BMTEZNKTsgfQ0KPiA+ICsNCj4gPiAr
c3RhdGljIGludCBwbGxkaWdfaXNfZW5hYmxlZChzdHJ1Y3QgY2xrX2h3ICpodykgew0KPiA+ICsg
ICAgIHN0cnVjdCBjbGtfcGxsZGlnICpkYXRhID0gdG9fY2xrX3BsbGRpZyhodyk7DQo+ID4gKw0K
PiA+ICsgICAgIHJldHVybiAocmVhZGwoZGF0YS0+cmVncyArIFBMTERJR19SRUdfUExMRk0pICYN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgUExMRElHX1JFR19GSUVMRF9TU0NHQllQ
KTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgcGxsZGlnX3JlY2FsY19yYXRl
KHN0cnVjdCBjbGtfaHcgKmh3LA0KPiA+ICsgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwYXJl
bnRfcmF0ZSkgew0KPiA+ICsgICAgIHN0cnVjdCBjbGtfcGxsZGlnICpkYXRhID0gdG9fY2xrX3Bs
bGRpZyhodyk7DQo+ID4gKyAgICAgdTMyIG11bHQsIGRpdiwgdmFsOw0KPiA+ICsNCj4gPiArICAg
ICB2YWwgPSByZWFkbChkYXRhLT5yZWdzICsgUExMRElHX1JFR19QTExEVik7DQo+ID4gKw0KPiA+
ICsgICAgIC8qIENoZWNrIGlmIFBMTCBpcyBieXBhc3NlZCAqLw0KPiA+ICsgICAgIGlmICh2YWwg
JiBQTExESUdfUkVHX0ZJRUxEX1NTQ0dCWVApDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcGFy
ZW50X3JhdGU7DQo+ID4gKw0KPiA+ICsgICAgIC8qIENoZWNrb3V0IG11bHRpcGxpY2F0aW9uIGZh
Y3RvciBkaXZpZGVyIHZhbHVlICovDQo+ID4gKyAgICAgbXVsdCA9IEZJRUxEX0dFVChQTExESUdf
UkVHX0ZJRUxEX01VTFQsIHZhbCk7DQo+ID4gKw0KPiA+ICsgICAgIC8qIENoZWNrb3V0IGRpdmlk
ZXIgdmFsdWUgb2YgdGhlIG91dHB1dCBmcmVxdWVuY3kgKi8NCj4gPiArICAgICBkaXYgPSBGSUVM
RF9HRVQoUExMRElHX1JFR19GSUVMRF9SRkRQSEkxLCB2YWwpOw0KPiA+ICsNCj4gPiArICAgICBy
ZXR1cm4gKHBhcmVudF9yYXRlICogbXVsdCkgLyBkaXY7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyBp
bnQgcGxsZGlnX2NhbGNfdGFyZ2V0X3JhdGUodW5zaWduZWQgbG9uZyB0YXJnZXRfcmF0ZSwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBhcmVudF9y
YXRlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwbGxkaWdf
cGhpMV9wYXJhbSAqcGhpMSkgew0KPiA+ICsgICAgIHVuc2lnbmVkIGludCBkaXYsIHJldDsNCj4g
PiArICAgICB1bnNpZ25lZCBsb25nIHJvdW5kX3JhdGU7DQo+ID4gKw0KPiA+ICsgICAgIC8qIFJh
bmdlIGxpbWl0YXRpb24gb2YgdGhlIHJlcXVlc3QgdGFyZ2V0IHJhdGUgKi8NCj4gPiArICAgICBp
ZiAodGFyZ2V0X3JhdGUgPiBQSEkxX01BWF9GUkVRKQ0KPiA+ICsgICAgICAgICAgICAgdGFyZ2V0
X3JhdGUgPSBQSEkxX01BWF9GUkVROw0KPiA+ICsgICAgIGVsc2UgaWYgKHRhcmdldF9yYXRlIDwg
UEhJMV9NSU5fRlJFUSkNCj4gPiArICAgICAgICAgICAgIHRhcmdldF9yYXRlID0gUEhJMV9NSU5f
RlJFUTsNCj4gPiArDQo+ID4gKyAgICAgLyoNCj4gPiArICAgICAgKiBGaXJzdGx5LCBjaGVjayB0
aGUgcmVxdWVzdCB0YXJnZXQgcmF0ZSB3aGV0aGVyIGlzIGRpdmlzaWJsZQ0KPiA+ICsgICAgICAq
IGJ5IHRoZSBiZXN0IFZDTyBmcmVxdWVuY3kuDQo+ID4gKyAgICAgICovDQo+ID4gKyAgICAgcm91
bmRfcmF0ZSA9IHBhcmVudF9yYXRlICogcGhpMS0+bWZkOw0KPiA+ICsgICAgIGRpdiA9IHJvdW5k
X3JhdGUgLyB0YXJnZXRfcmF0ZTsNCj4gQ2FuJ3QgeW91IHVzZSBESVZfUk9VTkRfVVAoKSwgRElW
X1JPVU5EX0RPV05fVUxMKCkgb3INCj4gRElWX1JPVU5EX0NMT1NFU1RfVUxMKCkgYW5kIGRyb3Ag
dGhlIHN0dWZmIGJlbG93IGV4Y2VwdCB0aGUgcmFuZ2UgY2hlY2s/DQo+IA0KDQpHcmVhdCBhZHZp
Y2UuDQoNCj4gDQo+ID4gKyAgICAgaWYgKCFkaXYgfHwgZGl2ID4gTUFYX1JGRFBISTEpDQo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKyAgICAgcmV0ID0gcm91
bmRfcmF0ZSAlIHRhcmdldF9yYXRlOw0KPiA+ICsgICAgIGlmIChyZXQpIHsNCj4gPiArICAgICAg
ICAgICAgIC8qDQo+ID4gKyAgICAgICAgICAgICAgKiBSb3VuZGVkIGRvd24gdGhlIHJlcXVlc3Qg
dGFyZ2V0IHJhdGUsIFZFU0Egc3BlY2lmaWVzDQo+ID4gKyAgICAgICAgICAgICAgKiAwLjUlIHBp
eGVsIGNsb2NrIHRvbGVyYW5jZSwgdGhlcmVmb3JlIHRoaXMgYWxnb3JpdGhtDQo+ID4gKyAgICAg
ICAgICAgICAgKiBjYW4gYWJsZSB0byBjb21wYXRpYmxlIGEgbG90IG9mIHJlcXVlc3QgcmF0ZXMg
d2l0aGluDQo+ID4gKyAgICAgICAgICAgICAgKiByYW5nZSBvZiB0aGUgdG9sZXJhbmNlLg0KPiA+
ICsgICAgICAgICAgICAgICovDQo+ID4gKyAgICAgICAgICAgICByb3VuZF9yYXRlICs9ICh0YXJn
ZXRfcmF0ZSAvIDIpOw0KPiA+ICsgICAgICAgICAgICAgZGl2ID0gcm91bmRfcmF0ZSAvIHRhcmdl
dF9yYXRlOw0KPiA+ICsgICAgICAgICAgICAgaWYgKCFkaXYgfHwgZGl2ID4gTUFYX1JGRFBISTEp
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgIH0N
Cj4gPiArDQo+ID4gKyAgICAgcGhpMS0+cmZkcGhpMSA9IGRpdjsNCj4gPiArICAgICBwaGkxLT5y
YXRlID0gdGFyZ2V0X3JhdGU7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+
ID4gKw0KPiA+ICtzdGF0aWMgaW50IHBsbGRpZ19kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3
ICpodywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGNsa19yYXRl
X3JlcXVlc3QgKnJlcSkgew0KPiA+ICsgICAgIGludCByZXQ7DQo+ID4gKyAgICAgdW5zaWduZWQg
bG9uZyBwYXJlbnRfcmF0ZTsNCj4gPiArICAgICBzdHJ1Y3QgY2xrX2h3ICpwYXJlbnQ7DQo+ID4g
KyAgICAgc3RydWN0IHBsbGRpZ19waGkxX3BhcmFtIHBoaTFfcGFyYW07DQo+ID4gKyAgICAgc3Ry
dWN0IGNsa19wbGxkaWcgKmRhdGEgPSB0b19jbGtfcGxsZGlnKGh3KTsNCj4gPiArDQo+ID4gKyAg
ICAgaWYgKCFyZXEtPnJhdGUpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVSQU5HRTsNCj4g
PiArDQo+ID4gKyAgICAgcGhpMV9wYXJhbS5tZmQgPSBkYXRhLT5tZmQ7DQo+ID4gKyAgICAgcGFy
ZW50ID0gY2xrX2h3X2dldF9wYXJlbnQoaHcpOw0KPiA+ICsgICAgIHBhcmVudF9yYXRlID0gY2xr
X2h3X2dldF9yYXRlKHBhcmVudCk7DQo+ID4gKw0KPiA+ICsgICAgIHJldCA9IHBsbGRpZ19jYWxj
X3RhcmdldF9yYXRlKHJlcS0+cmF0ZSwgcGFyZW50X3JhdGUsICZwaGkxX3BhcmFtKTsNCj4gPiAr
ICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArDQo+ID4g
KyAgICAgcmVxLT5yYXRlID0gcGhpMV9wYXJhbS5yYXRlOw0KPiA+ICsNCj4gPiArICAgICByZXR1
cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBwbGxkaWdfc2V0X3JhdGUoc3Ry
dWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwNCj4gPiArICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgcGFyZW50X3JhdGUpIHsNCj4gPiArICAgICBzdHJ1Y3QgY2xrX3BsbGRpZyAq
ZGF0YSA9IHRvX2Nsa19wbGxkaWcoaHcpOw0KPiA+ICsgICAgIHN0cnVjdCBwbGxkaWdfcGhpMV9w
YXJhbSBwaGkxX3BhcmFtOw0KPiA+ICsgICAgIHVuc2lnbmVkIGludCB2YWwsIGNvbmQ7DQo+ID4g
KyAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgcGhpMV9wYXJhbS5tZmQgPSBkYXRhLT5t
ZmQ7DQo+ID4gKyAgICAgcmV0ID0gcGxsZGlnX2NhbGNfdGFyZ2V0X3JhdGUocmF0ZSwgcGFyZW50
X3JhdGUsICZwaGkxX3BhcmFtKTsNCj4gPiArICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKyAgICAgdmFsID0gcmVhZGwoZGF0YS0+cmVncyAr
IFBMTERJR19SRUdfUExMRFYpOw0KPiA+ICsgICAgIHZhbCA9IEZJRUxEX1BSRVAoUExMRElHX1JF
R19GSUVMRF9NVUxULCBwaGkxX3BhcmFtLm1mZCkgfA0KPiA+ICsgICAgICAgICAgIEZJRUxEX1BS
RVAoUExMRElHX1JFR19GSUVMRF9SRkRQSEkxLA0KPiBwaGkxX3BhcmFtLnJmZHBoaTEpOw0KPiA+
ICsNCj4gPiArICAgICB3cml0ZWwodmFsLCBkYXRhLT5yZWdzICsgUExMRElHX1JFR19QTExEVik7
DQo+ID4gKw0KPiA+ICsgICAgIC8qIGRlbGF5IDIwMHVzIG1ha2Ugc3VyZSB0aGF0IG9sZCBsb2Nr
IHN0YXRlIGlzIGNsZWFyZWQgKi8NCj4gPiArICAgICB1ZGVsYXkoMjAwKTsNCj4gPiArDQo+ID4g
KyAgICAgLyogV2FpdCB1bnRpbCBQTEwgaXMgbG9ja2VkIG9yIHRpbWVvdXQgKG1heGltdW0gMTAw
MCB1c2VjcykgKi8NCj4gPiArICAgICByZXR1cm4gcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYyhk
YXRhLT5yZWdzICsgUExMRElHX1JFR19QTExTUiwNCj4gY29uZCwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25kICYgUExMRElHX0xPQ0tfTUFTSywgMCwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBVU0VDX1BFUl9NU0VDKTsg
fQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfb3BzIHBsbGRpZ19jbGtfb3Bz
ID0gew0KPiA+ICsgICAgIC5lbmFibGUgPSBwbGxkaWdfZW5hYmxlLA0KPiA+ICsgICAgIC5kaXNh
YmxlID0gcGxsZGlnX2Rpc2FibGUsDQo+ID4gKyAgICAgLmlzX2VuYWJsZWQgPSBwbGxkaWdfaXNf
ZW5hYmxlZCwNCj4gPiArICAgICAucmVjYWxjX3JhdGUgPSBwbGxkaWdfcmVjYWxjX3JhdGUsDQo+
ID4gKyAgICAgLmRldGVybWluZV9yYXRlID0gcGxsZGlnX2RldGVybWluZV9yYXRlLA0KPiA+ICsg
ICAgIC5zZXRfcmF0ZSA9IHBsbGRpZ19zZXRfcmF0ZSwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0
YXRpYyBpbnQgcGxsZGlnX2Nsa19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7
DQo+ID4gKyAgICAgc3RydWN0IGNsa19wbGxkaWcgKmRhdGE7DQo+ID4gKyAgICAgc3RydWN0IHJl
c291cmNlICptZW07DQo+ID4gKyAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsN
Cj4gPiArICAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICBkYXRhID0gZGV2bV9remFsbG9j
KGRldiwgc2l6ZW9mKCpkYXRhKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKyAgICAgaWYgKCFkYXRhKQ0K
PiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsgICAgIG1lbSA9
IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+ID4gKyAg
ICAgZGF0YS0+cmVncyA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIG1lbSk7DQo+ID4gKyAg
ICAgaWYgKElTX0VSUihkYXRhLT5yZWdzKSkNCj4gPiArICAgICAgICAgICAgIHJldHVybiBQVFJf
RVJSKGRhdGEtPnJlZ3MpOw0KPiA+ICsNCj4gPiArICAgICAgLyoNCj4gPiArICAgICAgICogU3Vw
cG9ydCB0byBnZXQgdGhlIGJlc3QgbG9vcCBtdWx0aXBsaWNhdGlvbiBkaXZpZGVyIHZhbHVlDQo+
ID4gKyAgICAgICAqIGZyb20gRFRTIGZpbGUsIHNpbmNlIHRoaXMgUExMIGNhbid0IGNoYW5nZWQg
dGhpcyB2YWx1ZSBvbg0KPiA+ICsgICAgICAgKiB0aGUgZmx5LCB3cml0ZSB0aGUgZml4ZWQgdmFs
dWUuDQo+ID4gKyAgICAgICAqLw0KPiA+ICsgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMy
KGRldi0+b2Zfbm9kZSwgImJlc3QtbWZkIiwgJmRhdGEtPm1mZCk7DQo+ID4gKyAgICAgaWYgKHJl
dCkNCj4gPiArICAgICAgICAgICAgIGRhdGEtPm1mZCA9IDB4MmM7DQo+IA0KPiBJTUhPIHRoaXMg
aXMgYSByZWFsbHkgYmFkIGRldmljZSB0cmVlIGJpbmRpbmcuIEZpcnN0IGl0IGlzIG5vdCBkZXNj
cmliZWQgYW55d2hlcmUsDQo+IGllIGl0IGlzIG1pc3NpbmcgaW4gdGhlIGR0LWJpbmRpbmdzIGZp
bGUgYW5kIHNlY29uZCwgdG8gYWN0dWFsbHkgbWFrZSB1c2Ugb2YgdGhlDQo+ICJiZXN0LW1mZCIg
dGhlIHVzZXIgaGFzIHRvIGtub3cgdGhlIHBhcmVudCBjbG9jaywgdGhlIGRlc2lyZWQgdmNvIGZy
ZXF1ZW5jeQ0KPiBhbmQgaGF2ZSB0byBjYWxjdWxhdGUgaXQgYnkgaGltc2VsZi4NCj4gSU1ITyBh
IGJldHRlciBvbmUgd291bGQgYmUgc29tZXRoaW5nIGxpa2UgInZjby1mcmVxdWVuY3kiLiBBbHNv
IHlvdSBzaG91bGQNCj4gdXNlIHRoZSBmcmFjdGlvbmFsIGRpdmlkZXIgdG8gZ2V0IGJldHRlciBy
ZXN1bHRzLiBVc2luZyB0aGUgZnJhY3Rpb25hbCBkaXZpZGVyDQo+IGFsbW9zdCBhbnkgVkNPIGZy
ZXF1ZW5jeSBpcyBwb3NzaWJsZSAod2l0aGluIGEgY2VydGFpbiByYW5nZSB3aGljaCBzaG91bGQg
YmUNCj4gY2hlY2tlZCBbNjUwIE1IeiB0byAxMzAwIE1Iel0pLg0KPiANCg0KWWVzLCB0aGUgZnJh
Y3Rpb25hbCBwYXJ0IGNhbiBjb3ZlcmVkIHJhbmdlIGlzIDI3TUh6LCBpdCBjYW4gYWxtb3N0IGFu
eSBWQ08gZnJlcXVlbmN5LiANCnRoZSBmcmFjdGlvbmFsIGRpdmlkZXIgc2hvdWxkIGJlIHN1cHBv
cnRlZCBpbiB0aGlzIGRyaXZlci4NCg0KSSBhbHNvIGtuZXcgdGhlIGRldmljZSB0cmVlIGJpbmRp
bmcgaXMgYmFkIHNwZWNpYWxseSB3YXksIGJ1dCBoZXJlIGp1c3Qgd2FudCB0bw0KcHJvdmlkZSBh
IHNpbXBsZSBzb2x1dGlvbiB1c2VkIHRvIGNvbmZpZ3VyZSB0aGUgTUZEIHZhbHVlIGZvciB1c2Vy
cyByZXF1aXJlbWVudC4NClNvIHlvdSB0aGluayB0aGF0IHNob3VsZCBiZSB1c2UgInZjby1mcmVx
dWVuY3kiIGluc3RlYWQgb2YgdGhlICJiZXN0LW1mZCIgaW4gZHRzIHVzZWQgdG8NCmF2b2lkIHVz
ZXIgcmVjYWxjdWxhdGUgaXQodXNlciBtYXkgZG9uoa90IGtub3cgdGhlIHBhcmVudCByYXRlKT8N
Cg0KQmVzdCBSZWdhcmRzLA0KV2VuDQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgIHdyaXRlbChkYXRh
LT5tZmQsIGRhdGEtPnJlZ3MgKyBQTExESUdfUkVHX1BMTERWKTsNCj4gPiArDQo+ID4gKyAgICAg
ZGF0YS0+aHcuaW5pdCA9IENMS19IV19JTklUX1BBUkVOVFNfREFUQSgiZHBjbGsiLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFyZW50X2RhdGEs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcGxs
ZGlnX2Nsa19vcHMsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAwKTsNCj4gPiArDQo+ID4gKyAgICAgcmV0ID0gZGV2bV9jbGtfaHdfcmVnaXN0ZXIo
ZGV2LCAmZGF0YS0+aHcpOw0KPiA+ICsgICAgIGlmIChyZXQpIHsNCj4gPiArICAgICAgICAgICAg
IGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyICVzIGNsb2NrXG4iLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXYtPm9mX25vZGUtPm5h
bWUpOw0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgICB9DQo+ID4gKw0K
PiA+ICsgICAgIHJldHVybiBkZXZtX29mX2Nsa19hZGRfaHdfcHJvdmlkZXIoZGV2LCBvZl9jbGtf
aHdfc2ltcGxlX2dldCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZkYXRhLT5odyk7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIHBsbGRpZ19jbGtfaWRbXSA9IHsNCj4gPiArICAgICB7IC5jb21wYXRpYmxlID0gImZz
bCxsczEwMjhhLXBsbGRpZyJ9LA0KPiA+ICsgICAgIHsgfQ0KPiA+ICt9Ow0KPiA+ICtNT0RVTEVf
REVWSUNFX1RBQkxFKG9mLCBwbGxkaWdfY2xrX2lkKTsNCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIHBsbGRpZ19jbGtfZHJpdmVyID0gew0KPiA+ICsgICAgIC5kcml2
ZXIgPSB7DQo+ID4gKyAgICAgICAgICAgICAubmFtZSA9ICJwbGxkaWctY2xvY2siLA0KPiA+ICsg
ICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gcGxsZGlnX2Nsa19pZCwNCj4gPiArICAgICB9
LA0KPiA+ICsgICAgIC5wcm9iZSA9IHBsbGRpZ19jbGtfcHJvYmUsDQo+ID4gK307DQo+ID4gK21v
ZHVsZV9wbGF0Zm9ybV9kcml2ZXIocGxsZGlnX2Nsa19kcml2ZXIpOw0KPiA+ICsNCj4gPiArTU9E
VUxFX0xJQ0VOU0UoIkdQTCB2MiIpOw0KPiA+ICtNT0RVTEVfQVVUSE9SKCJXZW4gSGUgPHdlbi5o
ZV8xQG54cC5jb20+Iik7DQo+ID4gK01PRFVMRV9ERVNDUklQVElPTigiTFMxMDI4QSBEaXNwbGF5
IG91dHB1dCBpbnRlcmZhY2UgcGl4ZWwgY2xvY2sNCj4gPiBkcml2ZXIiKTsNCj4gDQo+IC1taWNo
YWVsDQo=
