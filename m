Return-Path: <linux-clk+bounces-17717-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B0A29E13
	for <lists+linux-clk@lfdr.de>; Thu,  6 Feb 2025 01:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB2A07A2FDD
	for <lists+linux-clk@lfdr.de>; Thu,  6 Feb 2025 00:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA5618052;
	Thu,  6 Feb 2025 00:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UND2gM3D"
X-Original-To: linux-clk@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2046.outbound.protection.outlook.com [40.107.105.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D92B9A5;
	Thu,  6 Feb 2025 00:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738803231; cv=fail; b=ONXd2uXQK2S7H6vS6Fdr4Ziym+7TKJPaenPnArofs0tNaZtivfL6Q9oFJRHhnBrJ8sNhcVPUdUXiMQ/WP9juNkKyx8jvUUVQU2FdSSrQFzD6NJNWAOpBzu9X8YjwhBn7NS5LJmYnH7KZ7EX1fBUZNywlTJ1CQSZ4dkb4DF8s2+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738803231; c=relaxed/simple;
	bh=kpG6wWCgIXlbU+IOWl5nw3x4InrHYxvZr/Ha2PHY71U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a3XlMdYHozcM8pz9B5LZMEnSpQg0lIFE1BMz6n7ru73JnjOt3KGNYi/I6OXYPBWWgJVfNF9n9VKI1eaiKjoHSHpYUeqQ/6DTeqxJ3sTYxP77eVg8H7nviAx0yL/X5jgnrDvRee8IsYThlLGNISxnaxrX67JX1Mjz7utoV+ygu9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UND2gM3D; arc=fail smtp.client-ip=40.107.105.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8J5YYh6nyzkkr4yBMWMvVFXSqqAaifBdn5XmKEf/f2F04aHi8iQ6QiKOvtqaOSAYJfZY9V2bocySz7P1nkpnS45MUDl+/DKp20673OmDrwgcXd+2fi6wx6+eeVeIoSoGJ7FFL8nU8TTiCbH5o5r/0spvxPqSxGkvBDHixXFTKgtp9Nlc0CcUGaA/QfpPPFxnoOM/NXmwEPLwLJBgaxYMX1Fegoajl7nHIwn9wtViu51cMO7Pw9pv7/rkFNwrRA5rcVBeNJT+DOLZl086aUxHAT+X++bv0vVVdMIG5mhk7tyuJ3lmXjM8UAmkLVFfqGe64X+Mf2OBzSg8QuBp4ESKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpG6wWCgIXlbU+IOWl5nw3x4InrHYxvZr/Ha2PHY71U=;
 b=rBgzzBOnc2Cgf3pq8G2RewKSOrLcym8I/FUQJOK8UFKGTbwikPckhVMeteJSMjczrLMe60DilC42CLTsICmGeWpRH15BBOowGLoni/ZkmPGl7tiRjcyliC6umCxnebEa68giVZ9mWLapOXt1Jj78x2uAcr1WORgIV0mygAGDBkF97cE9gcgic3uUV6dY9M2WSLtjfxJNF7bVcKUXfIdbM7t4OcWznBwxPjxZ0FLr7m3zrwAwnsFP66e/8sU+uAxNUTcue4WR0piNyhGdq1INUEyzOXR7AK5bjf5ivX7u/e/tVwckUWE4SpxggH+5qV1QCMJHZtHMqOl81q7zYNPyMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpG6wWCgIXlbU+IOWl5nw3x4InrHYxvZr/Ha2PHY71U=;
 b=UND2gM3DshPKvnM23sKvfr5CVGcPCj6D9Hw49sekrySKU6UGsnViHiBF34K7NkpCZz4Cl+VYgzKr8icCWxecrngiLkrrMsPtMEwOLnzFRI61CAu275j/eUh4VFESKWliDz2y1cE9ZGRUcSugOSdjdaNbBapasIravgBv2GaFvcekTCCaf84+Lf88OFBmUU/hcV2q6aWfxuaDdR38MyLA1LWjo43zbiAHLayZpbnyrV6BmeMMN7hGYgpSnh3pMHjx4XZZ4xj62rpEw0kLpddbuYvOxyOmpHAwgBlA6wpVnmbrn/TGeLrbC4zJxcmu115qXqLWN3rVLC3e3z6tRDhZmA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB9960.eurprd04.prod.outlook.com (2603:10a6:102:38b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 00:53:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 00:53:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, Sudeep Holla
	<sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Abel
 Vesa <abelvesa@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Thread-Topic: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Thread-Index: AQHbd7N4T7OIDVDNVE+jQ2pnj57RO7M4kEgAgADfvrA=
Date: Thu, 6 Feb 2025 00:53:46 +0000
Message-ID:
 <PAXPR04MB8459F1CE0E8049355ADC9F3C88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
 <CABGWkvqXf0ZmJKofrbahB5N5uer6ye6Q4s_PXz_Z61vG2pMu=g@mail.gmail.com>
In-Reply-To:
 <CABGWkvqXf0ZmJKofrbahB5N5uer6ye6Q4s_PXz_Z61vG2pMu=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAWPR04MB9960:EE_
x-ms-office365-filtering-correlation-id: 21f208fa-1a05-423a-0040-08dd4648b610
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NE9rMlNJd0VWSThwUXpoZFlna0tFUnE5Lyt3MEd5K2g1bGU0RG9tNFc2NTBH?=
 =?utf-8?B?SlVLUUtwbXMvV2NBVWJVUXUzbDk2aktzQ3p3R0h1azVKSVphUE9va1FrU0Qy?=
 =?utf-8?B?S1JPbkpaUUtTVzdERXk0bXFHd2NHM2hVeFVkenV5MFMvZFY1ejFvK0xaRDVR?=
 =?utf-8?B?Skx1amZaUi9nVlZWeTFUNVlpV2VyL3ZRVlUwVlJGT3Q0bXpldmxsQ3pWQmVX?=
 =?utf-8?B?alVPcVJnYjFTbmlodEZ4Vnpxc3FkUmgvQWR5QkRFNjNRR2ppb2xoRnZWVjdF?=
 =?utf-8?B?L0J1RGwvaFRaTzhKbzlCenpjZjNPMVp2bzlCcmVNMWtqNFdhMlZwblp1SUtM?=
 =?utf-8?B?ZGdsR003UFZtTVE2VXBlQSsxVnhnQ2RtbHNaTUthY0I1c3JVWWR1R0xHRUxP?=
 =?utf-8?B?d0F6MnVHczJKdFdZMmZFQ0ExRUM4ZE1LcGhDdjl2dTRwblJyY2kraVNWWHBm?=
 =?utf-8?B?M29ZcFJENHBTMEFUeGxVM0hsbGtJcFNDeVg3WG1ZNEd2UFlIUk9XL0RYODE0?=
 =?utf-8?B?ak5zOGpraW04LzlNKzFYamlOWDRzY2pVNkVOSnJqMDhRdlNDZE1FZnlxTEVl?=
 =?utf-8?B?WjlWZ0NlS2kvNU9nbi8xMmxERlZTa0hPczlQeWJhSjMzQ2R0NHVock9MVlZi?=
 =?utf-8?B?Ym96cnMrRlhXNDhQeE5EakZ1KzF2eFB5UzRLVnNFMFkxMXpyTnBwTHdIT2t6?=
 =?utf-8?B?NHo2ZmR5ZUdabW5yQ1FVR2NMNU1RUi9USXVVL0xXazFaeW15eGEyR09za1lW?=
 =?utf-8?B?ZlB5aVRrTGpUT21iVFVnTTNwVHV2eVJ1Mkt5MExQaTRrK3FEUXQ2aFdKSFJm?=
 =?utf-8?B?cDNBaWpXaW1vVUZhQm0xY01OVEdDRDMxbE5uNXpaQVJJUnpYcC9BcnAvaWQr?=
 =?utf-8?B?YUkrSTdiamFkb1hhQW9nbjlNbXkrMXNOYitvZUkvYWl0eml5NmU1cnRSNWRY?=
 =?utf-8?B?Sy9NcnJUc05KTC9sayt6NGZUWWw2d3VKV3NKRURRR05vS1ByM3RRQ1V5ZHoy?=
 =?utf-8?B?aU1EcStvS1FVS2M4NmllVmd3Z3hqVlZxS0oxVm5KQlMzOVpnMzc1UERWY083?=
 =?utf-8?B?Q3VXbUxhdjhUUXFmZzlhcDNLYjd0RVFGMXpibHRKK2xQYkVrV1J1SjdPdjAv?=
 =?utf-8?B?VWxWelJCSVVPODFHQVNjaVRsQWhmTVNnU3JIdUNoZFFCRGJvMzVDYmRXRWlm?=
 =?utf-8?B?TVlUOHlERlQzRDA2SmJ6eXFlWk96SVpISWFnb2VVRUxrV2cydWpMSGx3Zjhm?=
 =?utf-8?B?enZPeUZtUmpxdmJkdkxsL2VON0dKQ2g4bDMwNUdybUNCR1h0MDFHbng3UGdv?=
 =?utf-8?B?Y2FyYjQwNGJ0UkZKb2ZuTFBVSVNidWZOTU5JRkFxUnZVZjFCRjZrRjVMd0J3?=
 =?utf-8?B?L2NhbkNCSmx4c0JxeWtkWFdvT0RPYjF0cHptWWQzTlZMajg0SytVcFVoaUYz?=
 =?utf-8?B?cCt2ODFEMEJIdXVrcmJmQytIZkRQeTJ1SkNQU0hoOWVkK1pZSkg3dS9XVzlU?=
 =?utf-8?B?NjZ0OHNOeHZ3cW9EQ0g4RC93UWZsTGtnOC94Z3Q4d2VidFV3b2RLMy9Ld1RX?=
 =?utf-8?B?eU9CZVc3UWE5V3JFV1ZXYzV3RnNlK1NubS9qSDA3QnhwRnVPd040bXhONXJm?=
 =?utf-8?B?K3UxWG5ZOC9MQkpUMS95eTdEWDFhZ2p4UXNpL1QrOGFzUmsxNFVYY0RPQitN?=
 =?utf-8?B?dS9YYkVpUExRVmFRL1NXbXNFOWNGQXdicDFNdlQ2K1EweXhjRkxqVU5nTlFE?=
 =?utf-8?B?M3VGazYzcGFoWk5EQlYvQlZadFc4YmJIM1RGMW90R1JtekJzR0dWMEhGblJZ?=
 =?utf-8?B?Ri9jd1p0eGp0bGZOSkNpTG1DajJwS0xMUFIra3ZsTHNudGNhM3ZhTmZoRHRt?=
 =?utf-8?Q?zjEQElStJKNUF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmJmQ1dnMkFlcmN0a0o3RGxsencwK0F2Q2R1Y0Q5MUEyZjRXWHE3L0haZ3Ft?=
 =?utf-8?B?VVdPWlN5SXo4clhCTmJpMGNNQ3BheUVtbi9nY0plaFNoUzZ0Y1hYL1RObFdl?=
 =?utf-8?B?MTZtUkJnaVJoSWNpT05OckJ2ODZFWllqK2VBczB1dEdjYlYvS3g4MG8ydC85?=
 =?utf-8?B?YmErOU1DeTJqTlpYZU5jelVrcmFMWHFlRmVzNTlmemxubkVoYTBNdFc5eTMv?=
 =?utf-8?B?a2h4SGtwOWRTQWZvWlBhTERJeWpmZ2NLVkpOTit5c09wVkF5Y2FMV0RQa09n?=
 =?utf-8?B?MWdTWXNsL01zY20rQ1JjZGhpZ2pteVpYeFoyWWJvaDhZeEFzRWN0YmZ0UmRW?=
 =?utf-8?B?MVc1bU1RRGh0TTFpeE1zUmc0ZW0way9xOHZ2Z3ZQZXNYSUdkaStjY3FNRnJv?=
 =?utf-8?B?Ukk2Y0VVTUY4Yk1Mbkd0SEMyeEFNbmR3RG5hWHBqVy9sTmlNNS9JRFJXQnJk?=
 =?utf-8?B?bzF3SklsVkxoL3p1Sm00Ny83NEh2dVNOcndpRnliLzhvYWdickJRQWtpdnh6?=
 =?utf-8?B?ZUNPRi9RRmJRU3ZCTXIwNjNQU2lYNjhWSXhOZVZJSnBXL1l3Y1F2REk3MzZH?=
 =?utf-8?B?ZjJOK3h5ZE5JM2N5dG11U2p0VzEvWklsQm5sUlBqOXRLaE1mM3VIdjlNd2NW?=
 =?utf-8?B?U2JkZy9FclRKM0xnemNzM29UNVVEenNYejFBWkxRRWpSSFU1NUJjMGd0TDgv?=
 =?utf-8?B?ak04VFZRbm82R25zRTNaSzJHanlpWWJMcG1kQTN3dWtncjZ6Umk1aStHTFVj?=
 =?utf-8?B?VWN0cmd0UUxCZWpRaGoySWZSaFVBYUxaVFZodzJDQ2tMdEpZd2hOMVFsaS9R?=
 =?utf-8?B?Rk8rZWt0QW5vZ0QvZDhNbXZmMktXbUhucEJ5OVVpN29ZUXpNR1loY0JPVWFm?=
 =?utf-8?B?TFJaOVYyd3IwSUJIdDUvYWxTdC93Tk5xY204VGEvQWwxd3RsZk1NdUFRTEVL?=
 =?utf-8?B?cXgzYVJrN09VOGRIUG04a2xEL2hZcEc4aHp2amkvSGUwM0RRb2JQYlBkTzE5?=
 =?utf-8?B?VnpOZ2xmeThVR2xFKzBXeGI2UHJoSVl0WStwLzlrbVhoRGk2eEdlT3pnUklU?=
 =?utf-8?B?Uk5kNU5Jd2JvOSt4TTRRNzhab3pBR21GR3Q4NjJ5Q2V1M1czZ3FzK2lUbFFF?=
 =?utf-8?B?UDEzSkxkU3hCSUN6MUJYTmZ0Ri9CNXZLUlRac0VQWDdwZjNKeGtYRGk0bTE3?=
 =?utf-8?B?Unl6Y3JLcmpWTmZ5eWZRVmM1cUVwL2pNZ1dEMUpKYzk4UGNyZHhQd3Y5enJ2?=
 =?utf-8?B?TlkrM1ZJRWowR3c4eEZGelRKbTU2MXB0TEhrRUU5dWVmQVEzY0Y3Y3I5NFpZ?=
 =?utf-8?B?WkRHVWJsc0t3bVpDZHdQTVpsbmx2U2hlMklHWlZzTmpNb3gveHV2R3hHTTE2?=
 =?utf-8?B?SkxqREk5MXFSZFlUdnFyVFU2d0pTV0s5NjRRblIrMjNHaHhMK3liQUFGUWVt?=
 =?utf-8?B?bXAzSDIxa3JpNmFkZ0p6aGMrUkVpVjlCdms4bTJiZ3lYVGR3NVZjcmFmendk?=
 =?utf-8?B?NlRMK3RMSlBqMDBMdDNOTmM5aWlzZ1QydVFvZEpsTWZKNUFEeXRaTDlYZ2c0?=
 =?utf-8?B?MFJjdElCb0YzWC8yRmVmQ29yQkpGU2srSmd6cmN0WjNpb1kzNk1aRUZaUlBH?=
 =?utf-8?B?K1dNazZLTnJaZ1dUSURRNUtaVUNjQXFHRXc5YWI1UCtZZXdFa2t3MFkvOWFJ?=
 =?utf-8?B?YkRKZU00UDArNVIvcVhIUklMbGRYZFVMM1VRdCtBckoraVhpYXpiRmF4ZXVK?=
 =?utf-8?B?a2ExVWw4cEZOZjlDVWdUamNtcVMwRTFTUUNkY0RqSkRXZmdtRTRoZElOTVFN?=
 =?utf-8?B?RTRRaWdrRUpFZW1ydkthL3p2QjFSS2JZeXU0TUU1WC9EVnVka1ZZUXNSUUIw?=
 =?utf-8?B?QjZxWXllZFp0bmFWV3JYQTdFVjdxdk1zclRDUlozZE1lMnhaQVBDemQ2ektU?=
 =?utf-8?B?eXJrRm5VSGQraDRIQ3NkL2xudlVBbU05QUxlSmp4RzNGS0RMR20zQ283NGd0?=
 =?utf-8?B?U1d6WWQydklUZExrRUN6bld0bVJBR0FYcmFWLzc5dnl2L1o1N3JVaE5OWExS?=
 =?utf-8?B?b0g3WjllMzErSjg3YXN0bXpjcENsbUtuMytoazFKYmZsOU9mZ21qRlZzU2I4?=
 =?utf-8?Q?S/qM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f208fa-1a05-423a-0040-08dd4648b610
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 00:53:46.2551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lFFABH0iEWrNgCh65LhEuXBR5eenbjDBKXOSB6O+M9RNhTK1T40V08TT1JyV88c3eQk2nm4+Wqict0AWQwLKdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9960

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDMvNF0gY2xrOiBpbXg6IHBsbDE0eHg6IHN1cHBvcnQg
c3ByZWFkIHNwZWN0cnVtDQo+IGNsb2NrIGdlbmVyYXRpb24NCj4gDQo+IEhpIFBlbmcsDQo+IA0K
PiBPbiBXZWQsIEZlYiA1LCAyMDI1IGF0IDEwOjUx4oCvQU0gUGVuZyBGYW4gKE9TUykNCj4gPHBl
bmcuZmFuQG9zcy5ueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFBlbmcgRmFuIDxwZW5n
LmZhbkBueHAuY29tPg0KPiA+DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHNwcmVhZCBzcGVjdHJ1bSBj
bG9jayAoU1NDKSBnZW5lcmF0aW9uIHRvIHRoZQ0KPiBwbGwxNHh4eA0KPiA+IGRyaXZlci4NCj4g
Pg0KPiA+IENvLWRldmVsb3BlZC1ieTogRGFyaW8gQmluYWNjaGkNCj4gPGRhcmlvLmJpbmFjY2hp
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hp
IDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gDQo+IEl0IGRvZXNu4oCZdCBzZWVtIHJp
Z2h0IHRvIG1lLg0KPiBZb3UgY2Fu4oCZdCB0YWtlIDkwJSBvZiBteSBwYXRjaCwgd2hlcmUgdGhl
IFNTQyBtYW5hZ2VtZW50IHdhcw0KPiBhY3R1YWxseSBpbXBsZW1lbnRlZCwgYWRkIDEwJSwgYW5k
IGNvbnNpZGVyIHlvdXJzZWxmIHRoZSBhdXRob3Igb2YNCj4gdGhlIHBhdGNoLg0KPiBQbGVhc2Ug
Y29ycmVjdCBpdCBpbiB2ZXJzaW9uIDMuDQoNCkFoLiBCdXQgaWYgeW91IGxvb2sgaW50byB0aGUg
cGF0Y2hlcywgMTAlIGlzIG5vdCBhY2N1cmF0ZQ0KcGVyIGxpbmVzIEkgY2hhbmdlLg0KeW91IGNv
dWxkIHNlZSBtb3JlIGNoYW5nZXMgY29tcGFyZWQgd2l0aCB5b3VyIHBhdGNoDQpodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNTAxMTgxMjQwNDQuMTU3MzA4LTE4LWRhcmlvLmJpbmFjY2hp
QGFtYXJ1bGFzb2x1dGlvbnMuY29tLy4NCg0KMS4gVXNlIHNldF9zcHJlYWRfc3BlY3RybSBvcHMN
CjIuIFVzZSBjbGtfc3ByZWFkX3NwZWN0cnVtIHRvIHJlcGxhY2UgaW14X3BsbDE0eHhfc3NjDQoz
LiBEcm9wIGlteF9jbGtfcGxsMTR4eF9zc2NfcGFyc2VfZHQgYW5kIGNsa19wbGwxNHh4X3NzY19t
b2RfdHlwZS4gVGhpcyBvbmUgd291bGQNCiBjb3VudCBvdmVyIDUwJSBjaGFuZ2VzLiANCg0KVGhl
IGxvZ2ljIHRoYXQgSSBvbmx5IGRpZCBtaW5vciB1cGRhdGUgaXMgdGhlIGZ1bmN0aW9uDQpjbGtf
cGxsMTQ0M3hfZW5hYmxlX3NzYyB3aXRoIHN3aXRjaGluZyB0byB1c2UgY2xrX3NwcmVhZF9zZWN0
cnVtDQoNCklmIHlvdSB0aGluayBpdCBpcyBub3QgZmFpciwgSSBjb3VsZCBkcm9wIHRoaXMgcGF0
Y2ggaW4gVjMgYW5kIGxlYXZlIGl0IHRvIHlvdSB0byBoYW5kbGUuDQpJIHRha2UgdGhpcyBwYXRj
aCBpbiB0aGUgcGF0Y2hzZXQsIG1haW5seSB0byBlYXNlIHlvdXIgd29yayBhbmQgbWFrZQ0KYXNz
aWduZWQtY2xvY2stc3NjcyBtb3ZpbmcgZm9yd2FyZCwgY29uc2lkZXJpbmcgU0NNSSBzcGVjIG5l
ZWRzIHVwZGF0ZQ0KKGNsay1zY21pLmMgY2hhbmdlcyB3aWxsIG5vdCBsYW5kIHNvb24pLg0KDQpS
ZWdhcmRzDQpQZW5nLg0KDQo+IA0KPiBUaGFua3MgYW5kIHJlZ2FyZHMsDQo+IERhcmlvDQo+IA0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLXBsbDE0eHguYyB8IDY2DQo+ID4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgNjYgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L2lteC9jbGstcGxsMTR4eC5jDQo+ID4gYi9kcml2ZXJzL2Nsay9pbXgvY2xrLXBsbDE0eHguYyBp
bmRleA0KPiA+DQo+IGYyOTA5ODFlYTEzYmRiYTM2MDJhZjdhYTQ0YWFhZGZlMGI3OGRjZjkuLjNi
ZGNlNzYyYTlkNjUxYTZmYg0KPiAwNDhkY2JmNThkDQo+ID4gYjM5NmFmOWQzYWFmIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvY2xrL2lteC9jbGstcGxsMTR4eC5jDQo+ID4gKysrIGIvZHJpdmVy
cy9jbGsvaW14L2Nsay1wbGwxNHh4LmMNCj4gPiBAQCAtMjAsNiArMjAsOCBAQA0KPiA+ICAjZGVm
aW5lIEdOUkxfQ1RMICAgICAgIDB4MA0KPiA+ICAjZGVmaW5lIERJVl9DVEwwICAgICAgIDB4NA0K
PiA+ICAjZGVmaW5lIERJVl9DVEwxICAgICAgIDB4OA0KPiA+ICsjZGVmaW5lIFNTQ0dfQ1RSTCAg
ICAgIDB4Yw0KPiA+ICsNCj4gPiAgI2RlZmluZSBMT0NLX1NUQVRVUyAgICBCSVQoMzEpDQo+ID4g
ICNkZWZpbmUgTE9DS19TRUxfTUFTSyAgQklUKDI5KQ0KPiA+ICAjZGVmaW5lIENMS0VfTUFTSyAg
ICAgIEJJVCgxMSkNCj4gPiBAQCAtMzEsMTUgKzMzLDI2IEBADQo+ID4gICNkZWZpbmUgS0RJVl9N
QVNLICAgICAgR0VOTUFTSygxNSwgMCkNCj4gPiAgI2RlZmluZSBLRElWX01JTiAgICAgICBTSFJU
X01JTg0KPiA+ICAjZGVmaW5lIEtESVZfTUFYICAgICAgIFNIUlRfTUFYDQo+ID4gKyNkZWZpbmUg
U1NDR19FTkFCTEUgICAgQklUKDMxKQ0KPiA+ICsjZGVmaW5lIE1GUkVRX0NUTF9NQVNLIEdFTk1B
U0soMTksIDEyKSAjZGVmaW5lDQo+IE1SQVRfQ1RMX01BU0sNCj4gPiArR0VOTUFTSyg5LCA0KQ0K
PiA+ICsjZGVmaW5lIFNFTF9QRl9NQVNLICAgIEdFTk1BU0soMSwgMCkNCj4gPg0KPiA+ICAjZGVm
aW5lIExPQ0tfVElNRU9VVF9VUyAgICAgICAgICAgICAgICAxMDAwMA0KPiA+DQo+ID4gK2VudW0g
aW14X3BsbDE0eHhfc3NjX21vZF90eXBlIHsNCj4gPiArICAgICAgIElNWF9QTEwxNFhYX1NTQ19E
T1dOX1NQUkVBRCwNCj4gPiArICAgICAgIElNWF9QTEwxNFhYX1NTQ19VUF9TUFJFQUQsDQo+ID4g
KyAgICAgICBJTVhfUExMMTRYWF9TU0NfQ0VOVEVSX1NQUkVBRCwgfTsNCj4gPiArDQo+ID4gIHN0
cnVjdCBjbGtfcGxsMTR4eCB7DQo+ID4gICAgICAgICBzdHJ1Y3QgY2xrX2h3ICAgICAgICAgICAg
ICAgICAgIGh3Ow0KPiA+ICAgICAgICAgdm9pZCBfX2lvbWVtICAgICAgICAgICAgICAgICAgICAq
YmFzZTsNCj4gPiAgICAgICAgIGVudW0gaW14X3BsbDE0eHhfdHlwZSAgICAgICAgICAgdHlwZTsN
Cj4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBpbXhfcGxsMTR4eF9yYXRlX3RhYmxlICpyYXRlX3Rh
YmxlOw0KPiA+ICAgICAgICAgaW50IHJhdGVfY291bnQ7DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2xr
X3NwcmVhZF9zcGVjdHJ1bSAgICAgIHNzY19jb25mOw0KPiA+ICB9Ow0KPiA+DQo+ID4gICNkZWZp
bmUgdG9fY2xrX3BsbDE0eHgoX2h3KSBjb250YWluZXJfb2YoX2h3LCBzdHJ1Y3QgY2xrX3BsbDE0
eHgsIGh3KQ0KPiA+IEBAIC0zNDksNiArMzYyLDQyIEBAIHN0YXRpYyBpbnQgY2xrX3BsbDE0MTZ4
X3NldF9yYXRlKHN0cnVjdA0KPiBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25nIGRyYXRlLA0KPiA+
ICAgICAgICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgdm9pZCBjbGtfcGxs
MTQ0M3hfZW5hYmxlX3NzYyhzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQNCj4gbG9uZyBwYXJl
bnRfcmF0ZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgcGRpdiwgdW5zaWduZWQgaW50DQo+ID4gK21kaXYpIHsNCj4gPiArICAgICAgIHN0cnVj
dCBjbGtfcGxsMTR4eCAqcGxsID0gdG9fY2xrX3BsbDE0eHgoaHcpOw0KPiA+ICsgICAgICAgc3Ry
dWN0IGNsa19zcHJlYWRfc3BlY3RydW0gKmNvbmYgPSAmcGxsLT5zc2NfY29uZjsNCj4gPiArICAg
ICAgIHUzMiBzc2NnX2N0cmwsIG1mciwgbXJyLCBtb2RfdHlwZTsNCj4gPiArDQo+ID4gKyAgICAg
ICBzc2NnX2N0cmwgPSByZWFkbF9yZWxheGVkKHBsbC0+YmFzZSArIFNTQ0dfQ1RSTCk7DQo+ID4g
KyAgICAgICBzc2NnX2N0cmwgJj0NCj4gPiArICAgICAgICAgICAgICAgfihTU0NHX0VOQUJMRSB8
IE1GUkVRX0NUTF9NQVNLIHwgTVJBVF9DVExfTUFTSyB8DQo+ID4gKyBTRUxfUEZfTUFTSyk7DQo+
ID4gKw0KPiA+ICsgICAgICAgbWZyID0gcGFyZW50X3JhdGUgLyAoY29uZi0+bW9kZnJlcSAqIHBk
aXYgKiAoMSA8PCA1KSk7DQo+ID4gKyAgICAgICBtcnIgPSAoKGNvbmYtPnNwcmVhZGRlcHRoIC8g
MTAwKSAqIG1kaXYgKiAoMSA8PCA2KSkgLyAoMTAwICoNCj4gPiArIG1mcik7DQo+ID4gKw0KPiA+
ICsgICAgICAgc3dpdGNoIChjb25mLT5tZXRob2QpIHsNCj4gPiArICAgICAgIGNhc2UgQ0xLX1NT
Q19DRU5URVJfU1BSRUFEOg0KPiA+ICsgICAgICAgICAgICAgICBtb2RfdHlwZSA9IElNWF9QTEwx
NFhYX1NTQ19DRU5URVJfU1BSRUFEOw0KPiA+ICsgICAgICAgICAgICAgICBicmVhazsNCj4gPiAr
ICAgICAgIGNhc2UgQ0xLX1NTQ19VUF9TUFJFQUQ6DQo+ID4gKyAgICAgICAgICAgICAgIG1vZF90
eXBlID0gSU1YX1BMTDE0WFhfU1NDX1VQX1NQUkVBRDsNCj4gPiArICAgICAgICAgICAgICAgYnJl
YWs7DQo+ID4gKyAgICAgICBjYXNlIENMS19TU0NfRE9XTl9TUFJFQUQ6DQo+ID4gKyAgICAgICAg
ICAgICAgIG1vZF90eXBlID0gSU1YX1BMTDE0WFhfU1NDX0RPV05fU1BSRUFEOw0KPiA+ICsgICAg
ICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgIGRlZmF1bHQ6DQo+ID4gKyAgICAgICAgICAg
ICAgIG1vZF90eXBlID0gSU1YX1BMTDE0WFhfU1NDX0RPV05fU1BSRUFEOw0KPiA+ICsgICAgICAg
ICAgICAgICBicmVhazsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICBzc2NnX2N0
cmwgfD0gU1NDR19FTkFCTEUgfCBGSUVMRF9QUkVQKE1GUkVRX0NUTF9NQVNLLA0KPiBtZnIpIHwN
Cj4gPiArICAgICAgICAgICAgICAgRklFTERfUFJFUChNUkFUX0NUTF9NQVNLLCBtcnIpIHwNCj4g
PiArICAgICAgICAgICAgICAgRklFTERfUFJFUChTRUxfUEZfTUFTSywgbW9kX3R5cGUpOw0KPiA+
ICsNCj4gPiArICAgICAgIHdyaXRlbF9yZWxheGVkKHNzY2dfY3RybCwgcGxsLT5iYXNlICsgU1ND
R19DVFJMKTsgfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGludCBjbGtfcGxsMTQ0M3hfc2V0X3JhdGUo
c3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcNCj4gZHJhdGUsDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwcmF0ZSkgIHsgQEAgLTM3MCw2
DQo+ID4gKzQxOSw5IEBAIHN0YXRpYyBpbnQgY2xrX3BsbDE0NDN4X3NldF9yYXRlKHN0cnVjdCBj
bGtfaHcgKmh3LA0KPiB1bnNpZ25lZCBsb25nIGRyYXRlLA0KPiA+ICAgICAgICAgICAgICAgICB3
cml0ZWxfcmVsYXhlZChGSUVMRF9QUkVQKEtESVZfTUFTSywgcmF0ZS5rZGl2KSwNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGxsLT5iYXNlICsgRElWX0NUTDEpOw0KPiA+DQo+
ID4gKyAgICAgICAgICAgICAgIGlmIChwbGwtPnNzY19jb25mLmVuYWJsZSkNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBjbGtfcGxsMTQ0M3hfZW5hYmxlX3NzYyhodywgcHJhdGUsIHJhdGUu
cGRpdiwNCj4gPiArIHJhdGUubWRpdik7DQo+ID4gKw0KPiA+ICAgICAgICAgICAgICAgICByZXR1
cm4gMDsNCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+IEBAIC00MTAsNiArNDYyLDkgQEAgc3RhdGlj
IGludCBjbGtfcGxsMTQ0M3hfc2V0X3JhdGUoc3RydWN0DQo+IGNsa19odyAqaHcsIHVuc2lnbmVk
IGxvbmcgZHJhdGUsDQo+ID4gICAgICAgICBnbnJsX2N0bCAmPSB+QllQQVNTX01BU0s7DQo+ID4g
ICAgICAgICB3cml0ZWxfcmVsYXhlZChnbnJsX2N0bCwgcGxsLT5iYXNlICsgR05STF9DVEwpOw0K
PiA+DQo+ID4gKyAgICAgICBpZiAocGxsLT5zc2NfY29uZi5lbmFibGUpDQo+ID4gKyAgICAgICAg
ICAgICAgIGNsa19wbGwxNDQzeF9lbmFibGVfc3NjKGh3LCBwcmF0ZSwgcmF0ZS5wZGl2LA0KPiA+
ICsgcmF0ZS5tZGl2KTsNCj4gPiArDQo+ID4gICAgICAgICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+
DQo+ID4gQEAgLTQ2NSw2ICs1MjAsMTYgQEAgc3RhdGljIHZvaWQgY2xrX3BsbDE0eHhfdW5wcmVw
YXJlKHN0cnVjdA0KPiBjbGtfaHcgKmh3KQ0KPiA+ICAgICAgICAgd3JpdGVsX3JlbGF4ZWQodmFs
LCBwbGwtPmJhc2UgKyBHTlJMX0NUTCk7ICB9DQo+ID4NCj4gPiArc3RhdGljIGludCBjbGtfcGxs
MTQ0M3hfc2V0X3NwcmVhZF9zcGVjdHJ1bShzdHJ1Y3QgY2xrX2h3ICpodywNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjbGtfc3ByZWFkX3Nw
ZWN0cnVtDQo+ID4gKypjbGtfc3MpIHsNCj4gPiArICAgICAgIHN0cnVjdCBjbGtfcGxsMTR4eCAq
cGxsID0gdG9fY2xrX3BsbDE0eHgoaHcpOw0KPiA+ICsNCj4gPiArICAgICAgIG1lbWNweSgmcGxs
LT5zc2NfY29uZiwgY2xrX3NzLCBzaXplb2YocGxsLT5zc2NfY29uZikpOw0KPiA+ICsNCj4gPiAr
ICAgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IGNsa19vcHMgY2xrX3BsbDE0MTZ4X29wcyA9IHsNCj4gPiAgICAgICAgIC5wcmVwYXJlICAgICAg
ICA9IGNsa19wbGwxNHh4X3ByZXBhcmUsDQo+ID4gICAgICAgICAudW5wcmVwYXJlICAgICAgPSBj
bGtfcGxsMTR4eF91bnByZXBhcmUsDQo+ID4gQEAgLTQ4NSw2ICs1NTAsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGNsa19vcHMgY2xrX3BsbDE0NDN4X29wcw0KPiA9IHsNCj4gPiAgICAgICAgIC5y
ZWNhbGNfcmF0ZSAgICA9IGNsa19wbGwxNHh4X3JlY2FsY19yYXRlLA0KPiA+ICAgICAgICAgLnJv
dW5kX3JhdGUgICAgID0gY2xrX3BsbDE0NDN4X3JvdW5kX3JhdGUsDQo+ID4gICAgICAgICAuc2V0
X3JhdGUgICAgICAgPSBjbGtfcGxsMTQ0M3hfc2V0X3JhdGUsDQo+ID4gKyAgICAgICAuc2V0X3Nw
cmVhZF9zcGVjdHJ1bSA9IGNsa19wbGwxNDQzeF9zZXRfc3ByZWFkX3NwZWN0cnVtLA0KPiA+ICB9
Ow0KPiA+DQo+ID4gIHN0cnVjdCBjbGtfaHcgKmlteF9kZXZfY2xrX2h3X3BsbDE0eHgoc3RydWN0
IGRldmljZSAqZGV2LCBjb25zdA0KPiBjaGFyDQo+ID4gKm5hbWUsDQo+ID4NCj4gPiAtLQ0KPiA+
IDIuMzcuMQ0KPiA+DQo+IA0KPiANCj4gLS0NCj4gDQo+IERhcmlvIEJpbmFjY2hpDQo+IA0KPiBT
ZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyDQo+IA0KPiBkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiANCj4gDQo+IEFtYXJ1bGEgU29sdXRpb25zIFNSTA0KPiANCj4gVmlhIExlIENhbmV2YXJl
IDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUDQo+IA0KPiBULiArMzkgMDQyIDI0MyA1MzEw
DQo+IGluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20NCj4gDQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJGDQo+IHd3dy5hbWFy
dWxhc29sdXRpb25zLmNvbSUyRiZkYXRhPTA1JTdDMDIlN0NwZW5nLmZhbiU0MG54cC4NCj4gY29t
JTdDYmVhZjViZGNjNjY5NGE1YTFhMTcwOGRkNDVkNzAxZGIlN0M2ODZlYTFkM2JjMmI0YzYNCj4g
ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzODc0MzUxMTk1MzA2NzI3MiU3Q1Vua25vDQo+
IHduJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1TURB
DQo+IHdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNE
JTdDMCU3Qw0KPiAlN0MlN0Mmc2RhdGE9VUZneTFiUzdRSjdxZW56S0ZUa1BCTmZPR24wVjg5Q0dS
OU5MT0JrYTBVDQo+IDglM0QmcmVzZXJ2ZWQ9MA0K

