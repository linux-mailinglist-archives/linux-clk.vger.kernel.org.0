Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2F5610130
	for <lists+linux-clk@lfdr.de>; Thu, 27 Oct 2022 21:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235514AbiJ0TLi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 27 Oct 2022 15:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236323AbiJ0TLh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 15:11:37 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80058.outbound.protection.outlook.com [40.107.8.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7D46FA35;
        Thu, 27 Oct 2022 12:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j23sbdoAsskjk/iIr9UY+xDL4pOp8PAm3MkxIJaL9lcnJTgZQzO0XBO001MdmErm4vP2KAjUZBsPWsooPnVaL4tCnXAVv38hB3wRj1nLvfwloQhb5ojy4CIQHUwkQOGCaGN4GAwFE65U0BQ6yeaY66c5holBJPRH7fPyY4fSxxjC3NqfDW+nfextbO5ZXG4z++dBnRt1NwaHcqfXygm119VgvuZEtE/OKfi8/PBvydnyyokSgoWIuyJ2+yWFa661g58BWA0JQrpKAjj3YbQiSVF5XH69GVKu8YQ8zZLgRdMjuePxEHFxyeGZBKC3jMtOXt89ToIwzV9GFkvOPu8A4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=Nkbe03CwAmHJY4FOpoJToNWeF8smaJpWPPkFY+KFbWHkggQLfjtOwpWl6g1bjytQNjGu5HnqLnYUU2G4CxDqKV3a1p97Mido2OR6gv9ISCEFodgND2xScUJ6ksRyL6nrb1KzS22wmNmF16fM0GO1qGObWjBAdgGpeFbfxgFFwS6m8PTf0NkhowwnzFOnO9o5jXquxhHaWoFq7ZUoTo3U8P3+UNFc2b1zAJOzxJbt3MiHWOJXFXaG3dD3Ne9MWuY5ifcT+txbZTy56xm57m3eIXe4annIy/rrpDX5AJn9uWWvW/PC35gO/LBK6VQ7+Aw/btK/Pi9BgvJvpU8V6KuPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=PgzwRG/9ry9JBvju1rWSB3P0CV15tKWLcYzfBAYlFruTzu4sE8HtyFM5oEr4fTQVl3i1Fw7Od26Devr3MRUFoNgQlR4EZxJ5MXBUmqC1eAR0ZI8PE410PpEpylZvgXRUY7GfH06fzEHadMA2u6P+oJiZDzNwngH/lZjP07uDlmMzxXqdGVPxQ7upp4lUtDfK85Hg/RM6A9f4qyeTjUHFyCewtPZbNJhfSm8cbU3kecRQXX2x9kLXiXLj+gbpRYQomhCOyVGxSJA0lEKdo02Dw57Xi/c4QqP2qi1cAB/qfxDwo5mRb43uldUIO7+YLiFK2Y8yFKNyHSrc6IC9bIshLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by AS2PR03MB9648.eurprd03.prod.outlook.com (2603:10a6:20b:5e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 19:11:34 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d%6]) with mapi id 15.20.5769.014; Thu, 27 Oct 2022
 19:11:34 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linuxppc-dev@lists.ozlabs.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH v8 3/9] dt-bindings: clock: Add ids for Lynx 10g PLLs
Date:   Thu, 27 Oct 2022 15:11:07 -0400
Message-Id: <20221027191113.403712-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221027191113.403712-1-sean.anderson@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::13) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB4973:EE_|AS2PR03MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9c6f79-4a1b-4985-93f0-08dab84f107c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hhuha1gLAFUqGsMsv/OLrvb5az19+g1JvF4H2HQhsbvtGP5re38zf8xUc1S+Hlz8o4Vtj8dfu0uxF3YnX2QUKVoDdq80ZVn8DMnccmmUibN2m7Xbp98PVSHcxYJHqNmlxHuos+3bd7CPKE6EykPr7a9xomZIKFICBtgEZh1hP93dtTD7oGgH0Zwt2+chwddS3shBB2aK4kUd4zkmAlPALrMPe9P1j+LySgn53onQXcA4ofjdjPX6CN8wYw+ZneQqxkmn2iQ/nVRaSVegUjO8dpcHK3f3bJWnZatup71t4/vgyxK00VCzaYhGmqAt3M8DW0zTr8KPBMrBoAO0DOfbTv6LnPI61/zv84voonvlHmbY84/nl96XdqtsHfXAEenFEq4Y5bs8vM3rkRBbwnq3zvPrKZB+KDagRhZj6x0yNiTaqOHjzw9o1T5XNgg5pNBo1Q1xkc67rF9iVWq0CsGcYQ0/67St06bgOZA1z9k2D9sBnUySCemWDLRhuQkzu9o+EUKsz34QeWT83reMOJJqEij72NsbVWK3mzbW50WL8P86u6AFaoe90Prc6D779k2MhIHA8+1972DznKrqt4tB7/9/TSEolf9lwaMCfmSAVcadpUHd8jtmsKz1mb5UkLeXLb/t+6VQePTp6fKEDlxmWwx00TGXZcyuATEpUokDMY7tTP0voZLGyZiSZN7/kd5ngDB5RS8YbArez9YX/ROdoHrYLdPIdQTG1Z6VoJm6akTcuH1Jbh7eV/VLOOguAFr/fn0xNbpM3H1/I4INtu2pxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199015)(110136005)(478600001)(5660300002)(54906003)(83380400001)(38100700002)(6486002)(7416002)(2906002)(44832011)(36756003)(66556008)(66946007)(8676002)(41300700001)(66476007)(316002)(4326008)(8936002)(6512007)(1076003)(186003)(2616005)(6666004)(86362001)(38350700002)(26005)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w1C7P7+8H2JStgJGPlDjrJDY2jclMy9M2bAoIoeh9BHbmoXClJ9zutGgFPNT?=
 =?us-ascii?Q?GNB4PHGnYtFs618e6EylzoKBdY8qCISXs6wlzmOad+/DVPmslEy5ORdcEqiP?=
 =?us-ascii?Q?lBP0iZSx+z0QBvZgyY+Wj5szr4lawreozj4mv/k/ZiL9H9JqUOW4T9qobdUY?=
 =?us-ascii?Q?8sH/kv9QVB3lbmoybeogTw46XgfGK6UvRGMdZX2Bha3CLM9lrY3rzd82F8CF?=
 =?us-ascii?Q?jVWxW2uLIw65//+hOxfjJTUxqcyt72r1dwshxHbHB8fZrkAUx7t6VYxZikmF?=
 =?us-ascii?Q?qSbJjrWAl6dnck9Bh28gX4vGf47ttzPGuLln0C+5SY3Jr9loR16i5qqaidcK?=
 =?us-ascii?Q?TC/JgylkKrWd3XZCXronwuHRh7aOaw23nIb5tl02hVdQ1PZyX7zepKFTDGSF?=
 =?us-ascii?Q?viU6oPu5OFGi71Wak1nX88OnFssq2kVaeMIQQ6ynZPbkvgUq7q5LrwLVtQRd?=
 =?us-ascii?Q?S1oFna0mnaM5NxLiaUAYscz/ghSdlT2H3hMtoQPf0Xr6is/iaRHSY5+zpClj?=
 =?us-ascii?Q?0tzL9lPGbvTR6J1j3Eha9m/nCdOUC6F/kijVAo8sSXXRpbyIB5H4sFzjlXxG?=
 =?us-ascii?Q?9CXjW3Uxyb4VC5OKIRl6REMRIaYR91RoUpab6ifKMiaCoMkBxIvjwO+lMwnP?=
 =?us-ascii?Q?B3Ge0YigCP5t36qM/5BwzYfjHHu9775Tx80xHiaHHQBCd49T4ZGmbGJuKHX6?=
 =?us-ascii?Q?PzPlPsCezz9xqRExS3C1lVBxBoxK3EwMroSa+grLr1ATYFrL2n5RJ5zMDZ4C?=
 =?us-ascii?Q?pHHoZOfnQkq9tnbjq6hhSw1sHiG7GQEGIdl10nMVKuWBUNlqvz9LbuZZTp/B?=
 =?us-ascii?Q?bKo/L+53oADOnjXlxLJ8F0YsTP7lEm+ycETG+cFUhvb2OK51A1HXFAwuLrK1?=
 =?us-ascii?Q?QNvWTS3QEslqwG5DXrtGUNvsAjOKIv2gGNJwApdeaeBzfPcooRin7qT1h4gj?=
 =?us-ascii?Q?v1EzR1x3ySekgP9we5LNBAmmKFEUxm+gH5U8KTIZPrJmr2jSYF/qGNawrtVU?=
 =?us-ascii?Q?DVgd2fo0bmFEw0ChNvw4YhF1QYAtiMJ5V8n/+VJeGu5c4GKkfSI+pwofNu+F?=
 =?us-ascii?Q?kUJJqYfCVoJPShx+OSpn/4pbhBWyWHHNooZ9qKxqTBTlIMm9zJBOQ6F3gELr?=
 =?us-ascii?Q?ylQ/ciBWMG1YX7u3Wr7upo6/i6OGoOwdE0xp0VMU2qUq0qGgw88zWvUiEzRT?=
 =?us-ascii?Q?TVCdC7IQn5C1Nlgomijq3LBdl/Wa8MEq+5OaQ/mYe8dnIAT3V/vfyM8T+/wr?=
 =?us-ascii?Q?5Gzdar6oD9bOW2y0Av1YcTUZawxMvT0ipD5yESQttmgwyZK5Z8qxREZa2N60?=
 =?us-ascii?Q?Wt+wqGFCZUbQ+Jsu9SS1SSDXMgb71ZW51u+yoztN97Vs379Xr8sbBB+A1P7O?=
 =?us-ascii?Q?eG3StOajpkBta3H2yZ908Yp/CpEP5Xddur/FwDCLk4KR3YDTJknrcvcBFd8q?=
 =?us-ascii?Q?hsaqVw3fYN1HCa6lR1W0SJi4hMlyrYMZE9WFW1kpYfCjUjA/sZMSDP7T5vGV?=
 =?us-ascii?Q?FuNkyqkpbUC+9ZUrmc3Ys3k8EnaW/J5gR1vWH34WJ60Cmt4pHiQL9pFR7Ed2?=
 =?us-ascii?Q?A3IBO0rwggjjb3VpyoU8FMnf6QzGE0ZuhkzbrF9OZ47BxyPZkh6Wa5rxRwEi?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9c6f79-4a1b-4985-93f0-08dab84f107c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 19:11:34.5967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NkzkqhUkfZ+kDLcyAE/O5bAGIsJ/zzZnPAI8cNEA0xmerZ+4ySXTrcT85wBFv/PS0mZ+ospwsauO2lxclXyMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9648
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
with assigned-clock* to specify a particular frequency to use. For
example, to set the second PLL (at offset 0x20)'s frequency, use
LYNX10G_PLLa(1). These are for use only in the device tree, and are not
otherwise used by the driver.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
---

(no changes since v6)

Changes in v6:
- frequence -> frequency

Changes in v5:
- Update commit description
- Dual id header

Changes in v4:
- New

 include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h

diff --git a/include/dt-bindings/clock/fsl,lynx-10g.h b/include/dt-bindings/clock/fsl,lynx-10g.h
new file mode 100644
index 000000000000..15362ae85304
--- /dev/null
+++ b/include/dt-bindings/clock/fsl,lynx-10g.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ */
+
+#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
+#define __DT_BINDINGS_CLK_LYNX_10G_H
+
+#define LYNX10G_CLKS_PER_PLL 2
+
+#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
+#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)
+
+#endif /* __DT_BINDINGS_CLK_LYNX_10G_H */
-- 
2.35.1.1320.gc452695387.dirty

