Return-Path: <linux-clk+bounces-29039-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9414BD5E8D
	for <lists+linux-clk@lfdr.de>; Mon, 13 Oct 2025 21:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C268404B2C
	for <lists+linux-clk@lfdr.de>; Mon, 13 Oct 2025 19:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA0727055F;
	Mon, 13 Oct 2025 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Blpfc145"
X-Original-To: linux-clk@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016C21D5CD4;
	Mon, 13 Oct 2025 19:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760383040; cv=fail; b=E+TtHa3shGfrFwl6sOWUN8puf/BlrbyPXsZH5i7Y1/TaiOj+TRHgadBQdBFEmT017N6r9Zv5nOu8JX/YP8XYLcbWnHzrRHQbuViul14yli/A7ga2hM5pgvrY6maXswXNMdbG2huCS6dMPWCRsxJMw4iPYnjJTLWHPu+XiqDjDtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760383040; c=relaxed/simple;
	bh=+eazkJrq4oeABACakvDYo93FCVDyHMIP79SbnAuVn+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ELuLb2+SLVTk9XcFFww9FkUE9McVx6vkhmzdjePXIZOHaKYc6tDSiTs00aMTh9mRHZbgdDcPOSYT/57XoNt4gt7vy5hrArdMSOpRNZpn5yhJCbusDyMOXg5/Z6yoruhJHQ9cgt3V7hvEK+xrkBz11DZ/wqr1Lrqy4rHwuJWjpE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Blpfc145; arc=fail smtp.client-ip=40.107.159.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMQuGlFJrTaJkY/MjP8W23FCz89ezmyXyKtoa3nu1D0Cn3XrG/sHHZRPqn6fDGjtBhht4koXQlYGxrwp8wtiuV5k81RMQujR0AHA5FIZEqY8zZBK7kBlx8LTQkbAjiJcjj2gGCEzTt3e48Cmk2GialI3y0INHzyFbV0j0z47UG93xMQujPfZpUiZvHGth4/OlB91eTyumm7QhmmLAWYM6VgG3wgmnoZB2NBM1xEsHdyTgBh6E6Qv+z7FqDPJw0FLxN4Ldf5y6LUrrt9HC2K5rFhK84lIzNDjzLCdLJ0TP9l3/DWXhVskoj4WJQNtufVb1KadryDBZfZEgnJ9fdX/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btbcrBQ2U8tWK3r4+m5oMZaf/eSc0efXevZvPE1eP5Y=;
 b=XM6YEc4j28mWJO+xyygLuXl7t+rONby09SJxiSTN9IwLzNBujst7E/MtcvTE3aGG0UWZb+1RMgHtkq1aDFgj/AnmfPe1sM3Rut7tBZvnFZIXJoi843XdH9PvoH41SAhyiA+nHUd/53cqIPn51qZgVmyyFGNk1dMU5WV3FpBETuz//5ttt1NFozy2Fwf1Q4iULYTWXrkIDPCIBY5gBph+CPC/uXumTdvu1fO6tjK9mPpxsshz+E8YG4GoSUjXSzt8FIYJHQ5T7IqE7f1lFzw/u9qisGS2+mRGcGGwMYyEeobnSb2e9b6Wk0jl7iXjSZ+Vudzop3E/i1FATyWPAefY7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btbcrBQ2U8tWK3r4+m5oMZaf/eSc0efXevZvPE1eP5Y=;
 b=Blpfc145QGFIcarTyKOwEP6RFc5CaGoshuI/DwJmtp92x5nM4wnQQusJNmRNQEL9SJDr+AnhBUV5xaJMxfc8agKesn3HQ/q3uNiw5TJFjgtHr9cmg08JKR7J/Z8CuUOBjfCSWGKDnIptpBZSj+87YR9Sww2qD0lWpui25t+Y2nNVfRWnYvsVHWPnOr8+boQg9I9nn2E7Cf//oFH0tRmSNvjrZGtuJ2kRl51HlijnMzdbiKdIa2xGGqOQSWKH3VupAFCZD0N5hw8s3actxscTWkaYiUGa5TRkZQ6DlewdQ98qF01BqTN9+3ZcGFhrFN2Vxgnmqq4EyfbA958i3wqaKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PA4PR04MB9486.eurprd04.prod.outlook.com (2603:10a6:102:2a3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:17:14 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:17:14 +0000
Date: Mon, 13 Oct 2025 15:17:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 31/39] dt-bindings: clock: Split support for i.MX95 LVDS
 CSR
Message-ID: <aO1QMD6e1Wx+/hFP@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-32-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-32-marek.vasut@mailbox.org>
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PA4PR04MB9486:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d97bd2f-e013-4f75-83a4-08de0a8d1dd2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?YczU/R61+TH8Ov1UypA1sAKIcv3WLS31u5WMu2eFNnf4o6pNSWzQ7PZmNk+h?=
 =?us-ascii?Q?iQ1jlvsij8upDHrjUJ/W4cB0PcQ0fkTaF+Rz89+G0GcBReoG0MCW173o0jKI?=
 =?us-ascii?Q?hXfaGGBXJcRbZZqUHQmsOkPqgUSqulNly20pQF9T7rktg0aaWKDWDJx4bCLw?=
 =?us-ascii?Q?ru2iaB5gvm5Q5aQN9D7UstIrw1oZAYg/WkebsCKQLzyclIhb31zaFQnrZVoL?=
 =?us-ascii?Q?7JlzMIWppAHib7SkVpN0PmQy5cX3bsK6lAgNnzgPsPFg+Rr/ORaP2QU9DQ9L?=
 =?us-ascii?Q?fR8XHOBSK552LoTzL/FKP12YPQUda36mMSSOhp/RVgvlXAdoSgsZq3f+MihB?=
 =?us-ascii?Q?YxAJIl8D2TLpa4ZhwuHT96ktOudfHgIxA+JHgfVT68K1cwm9/3KjViAN69fD?=
 =?us-ascii?Q?uP6JixRf3ouf33fmtb7DSEZjHnT2BtGyQJujoZ/E6yCWbV9wys77pfhbXrV8?=
 =?us-ascii?Q?w179WSOKDSODYzDB2mxPorTEpxgJnEtd4o0frizotuIaYX/K3H0HPX2da7yb?=
 =?us-ascii?Q?IIVxsS+bZQ3hBZeKx2IzdqulUzk1pQwK9TCNZBlBcoyS8pgAuwg1FedoHgku?=
 =?us-ascii?Q?AQlnWuOklre9Y6CGVMl78QrDDp9Wbu/C5fgpe9X1l2UbW9gfae1jLEL5V1Hx?=
 =?us-ascii?Q?Lm56owLBNrK2IsnDOVNWoVy+rCTAd+gSVP4aXpttj00eLjno1Qz9cJeLiI0K?=
 =?us-ascii?Q?1Ee3DdfZkj0r8Mb/SFkCK/4qtaYIEACb1NxEWvZoDcsdnQxLpk8lYM6+S/cG?=
 =?us-ascii?Q?69YbXXfkO0No+tW8x2WjaVoFvyio/wIeuM4xdsVGDmj5C4hmn/TOTTDMX4Ug?=
 =?us-ascii?Q?IEBmcwMbVewu5GkqE8qYVPLmt6Wcg7At8QPwcYqkACPZRiQoFbQKgcjtOkec?=
 =?us-ascii?Q?JoHqcB8mQHdCwu+RtLI7Mf0fyr/DFO09dm1qzChZq6gyZHlKy0BNac6VWiog?=
 =?us-ascii?Q?vssQHpdYJHABmtt6caDm7WkGJXReqaPeeDu7NdGFKmGCq/zo/OcFZ2pkY2xX?=
 =?us-ascii?Q?hOgQGIpdyUqKy3e5ArDzgsgvT59IvykyxLZF/DBToXCnq6cDiilua8wypVw6?=
 =?us-ascii?Q?YAMEYYBOgpOPMjXrXG7WRsTX0iBiiZARxmbBU6W24miotIMa4AVhNifFH6Mc?=
 =?us-ascii?Q?YSGcaFpFIJgCq7JwCk1uZoAM7qKhdrwF7H0S8I8uqngl1KkAwjs/Y6BH14hz?=
 =?us-ascii?Q?AfYLD+7jG16T2rC3m4QAf2wFNIoYwF0kg3p0H/A7y7lxnQJ9pZowN2q7S5c9?=
 =?us-ascii?Q?wpkxk/f9NMB7/5VPelnJi/BqQ2ua67lkSyKOGMONcJM6iST4ZXOGqSrvFFsl?=
 =?us-ascii?Q?LdkFTPU/IJOPPQRDy0IXWsHEFokP448kNyKqJ6Nb7QT3VKZEVfjmF7ueE77P?=
 =?us-ascii?Q?2iTk0p5jYCym5ORdNQVuq/vCPaMs/zrS6QkapTIQjWmiqFCfQTSIUYJi5vof?=
 =?us-ascii?Q?nIihPYLGJU6C373rVADnxdAdhX5l/0dNRNi9qYjH1eynZ2SVZaYqbA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?CviHSAHpPhz6s2rawc0SXkZ7ebttjkkD0ckG8R6Fm+lnMzaU+16Wnril5pxE?=
 =?us-ascii?Q?OXr8YwPRYVBULLHnZpM6TSdRSguZRvMDweXwomiv47um0wI8/lHdKjAVo9Sh?=
 =?us-ascii?Q?XDQWqE9rQKoF9PRuevOkKb0DbtvSdptVZVP2+fbsHkB30bWUEiUrZQySmHCF?=
 =?us-ascii?Q?4nkmRsxiGC4kT3eHBJdI2Vuqh2IFG+YdBU08Y3H8zga9YXeUSQQ/H5Nqtlqe?=
 =?us-ascii?Q?YQXpEwhvXr2H0MTcR12BmieWsuQdwGkaHMCCJ5IDPLqpWkjxNkB29NKJWc+N?=
 =?us-ascii?Q?F5HYFBDijnfaGeCEnOH1dw1UEWRQ68QH7l3muEbCRiLp6L7Bd4Uoq0kM9RdY?=
 =?us-ascii?Q?k4sEbTDh1Qt3OEvbenXJDDdQFob9Ebbv7PyXDi1uyDJyNMjrIGGeiOuF7fOW?=
 =?us-ascii?Q?yF8PZfjuwxlz/QtXGE4OFV7LhfPjWkyhWMiobPtC6FRSVitZ+jo/cVPNMr5V?=
 =?us-ascii?Q?TEfHyAfuH3Bv/ORGH7UUfeqCywESfnO8+aYlx+6xqAwaHIXkjf8Vt/M+C37t?=
 =?us-ascii?Q?UW85SrDkTO1gSRW0osCmYCrk+cyrMrZqAUNF6FwTEQGSUKfXp2W8E9Z+pt6v?=
 =?us-ascii?Q?g7b2iZxeDx1UZYp1K8RGt7/c/ZJnuSbYgND9+QlmdmdkTlez7cW/Y5RrSbg2?=
 =?us-ascii?Q?YPO4pjd3wgKf/1ofqGL4RKSScAw9rVkpqTa4tQgFBPVUyacsBFvarBi36bMR?=
 =?us-ascii?Q?8DJYBz0+Tbo6xUzJlStG+5GI5skQF/v5kky9BWHpez5Xo1evSB5rJ25aJq9O?=
 =?us-ascii?Q?kf4yPGDl/mZtwjfXcSjFaIQaLzprn8vOHvD5WXsoaMQAGDPfZJE+HmW1ITrD?=
 =?us-ascii?Q?OOdg7iRD49w702yo0OqkAT1iWoK2ilNaLNbH8Gh0cqEDElHEQ4giXbV6+M/O?=
 =?us-ascii?Q?3Eem6b6O/oq7E0XMZt0yn62FMixfkaZF8EB7y/Q2NNxRqfdIf1jE6WSI3aOh?=
 =?us-ascii?Q?BlYeXrcXdt6sFvabrzT0y8NPn6rkR0gmXSwNIWrYXKtZJh0ryfbjsa81Z0J2?=
 =?us-ascii?Q?IpnDoUGdgiM9JX6icb6wEJy9Xh8428V+UFxI+amgL1sOaGlA+XWWbFvrT9Cx?=
 =?us-ascii?Q?ecLZ33sUPeAGJcSq4GCpHrvX0grqbI0COVHxZarvr/1ryZDG2dQ8FepyVWua?=
 =?us-ascii?Q?PUfPxHhrNzj9Lyf32NQvVY8Bpkknk1csKne8dqJYeXoHNHAbGQPAh8pfJIAM?=
 =?us-ascii?Q?fKPr0TfNwRv0BbXpAXyOljnqQoR1NnO5rSKgjMh0PXXCQOSc9IRsk3CffMER?=
 =?us-ascii?Q?4I27PheQbhVcOXYWXt6PzmhW+Azb5NAfSuG9nXSFkJfY3+Bb2zGmhlVPDPXM?=
 =?us-ascii?Q?yp4Z6349huCWAnYvX/A8g7fzaJhe3zOtPWzVZ7kS6ga9W1v4MAaqYGeDh+Xs?=
 =?us-ascii?Q?Bp/3ZVzIsdJd8VJUE1nLvSzqkRjge0if4T5zH5XNL7NzFEs/qNNA+vUSJABg?=
 =?us-ascii?Q?sdUFYq9hbAXMuz3GEUppTpTENcddxekHV9gHgqhjD80hfRCyOjYyjZHsj97I?=
 =?us-ascii?Q?CTipO+3+O38eJ5vXlzkVYwblGbVPB+++OteNC7ZU1y1w3TztEe04nqgqBMCC?=
 =?us-ascii?Q?qXiQuobMIKCIv7vBpFfSjJH6aYCZbLe/dbZmG1j6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d97bd2f-e013-4f75-83a4-08de0a8d1dd2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:17:14.2019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ruyDaX78N/wpe+ggWtsy7mWrpifv7A1hgcqLI7PAeHpaxa6v2WN1Lb82+aU8Ibm0k3cmaGutxwX3QxbstrN8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9486

On Sat, Oct 11, 2025 at 06:51:46PM +0200, Marek Vasut wrote:
> Split i.MX95 LVDS CSR into separate binding document, as it is different
> enough from the other CSR in the block controller binding document and
> has subnodes too.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml     |  1 -
>  .../clock/nxp,imx95-lvds-blk-ctl.yaml         | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/nxp,imx95-lvds-blk-ctl.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d62..0a28e24135243 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -18,7 +18,6 @@ properties:
>            - nxp,imx95-camera-csr
>            - nxp,imx95-display-csr
>            - nxp,imx95-hsio-blk-ctl
> -          - nxp,imx95-lvds-csr
>            - nxp,imx95-netcmix-blk-ctrl
>            - nxp,imx95-vpu-csr
>        - const: syscon
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-lvds-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-lvds-blk-ctl.yaml
> new file mode 100644
> index 0000000000000..663f3ee1df4e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-lvds-blk-ctl.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/nxp,imx95-lvds-blk-ctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX95 LVDS Block Control
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@mailbox.org>
> +  - Peng Fan <peng.fan@nxp.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: nxp,imx95-lvds-csr
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell. See
> +      include/dt-bindings/clock/nxp,imx95-clock.h
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^lvds@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: fsl,imx95-lvds
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true

Is it standard phy interface? need phy-cells

> +
> +    properties:
> +      compatible:
> +        const: fsl,imx95-ldb
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - power-domains
> +  - clocks
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    syscon@4c410000 {
> +      compatible = "nxp,imx95-lvds-csr", "syscon";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      reg = <0x4b0c0000 0x10000>;
> +      #clock-cells = <1>;
> +      clocks = <&scmi_clk 76>;
> +      power-domains = <&scmi_devpd 13>;

Need full examples, included phy and lvds here.

Frank
> +    };
> +...
> --
> 2.51.0
>

