Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F026A6B7D0F
	for <lists+linux-clk@lfdr.de>; Mon, 13 Mar 2023 17:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjCMQMZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 13 Mar 2023 12:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjCMQMY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 12:12:24 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04hn2205.outbound.protection.outlook.com [52.100.18.205])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EC0746E4;
        Mon, 13 Mar 2023 09:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=JWlLAkDShs4NbKy9w4Tsv8z7C/0kKMCXyw0/m3RU0iW9AOd4XuOQ0HjvWaob0tjcSilSRzkthvioLw4Vu5GlN22FV3ek5EaBCwwRVJSQsCVmVNNKA048btiNDDbUwE+eBQIop6IfCpO5Oz9m9NhTYDndgTqBXug9MCM4a4ZY5SaZx0bmF7syKLGUbKgVjdy7AWuZVVqJjHfh61TsjpVPbAF6LFxpt38JofQj1U1DMFgieBs81BbXVVGDu5U5aw/HUt7E1G5xVwljoE54slYKGaO/Do9UtKPj1/HjLB0QKC4IrOCitSPTZgWceOk+8uTCRtHjNHVFTZIh8U6ZhSMgRQ==
Received: from DB6PR0301CA0016.eurprd03.prod.outlook.com (2603:10a6:4:3e::26)
 by DU0PR03MB8289.eurprd03.prod.outlook.com (2603:10a6:10:311::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Mon, 13 Mar
 2023 16:12:19 +0000
Received: from DB8EUR05FT064.eop-eur05.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::b9) by DB6PR0301CA0016.outlook.office365.com
 (2603:10a6:4:3e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23 via Frontend
 Transport; Mon, 13 Mar 2023 16:12:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 DB8EUR05FT064.mail.protection.outlook.com (10.233.239.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 16:12:19 +0000
Received: from outmta (unknown [192.168.82.140])
        by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id C1DEF20080272;
        Mon, 13 Mar 2023 16:12:18 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.57])
        by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id CDE362008006F;
        Mon, 13 Mar 2023 16:10:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VD2j7QY0BuCGZCLhpWoG0ESz7HMmkXINhyoLTaAyUlYUWcEH6MJSlKqsV9t5JFy+Ve7GlD+d4y7U5+IuFgJCqIGQ3CgAPj/tg/cRsKXD5KbXhSDjG4X61Qx3Kg7D8Md/4e3S6ouFbQh9LEKyk7cd/j4ZWhZMoT+RUHjJcK30GGn45spMVSdUay1rysvYxe/ziew2T4YZtSDG635h7pyoDfNlF+1FdG1AWA9i5cQdkXDIoLIuqIJllZ2ykaw9kPfNwNLExFlVAmRCY/jFNM8jqyAQ/5Bik3g+eUnf7zoK2shVucr+/z/G4Ezv5kn+ZNa3DMi8p6LgLC7AK1vrtUGpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=mLvws4M1qTIbCh0QONSdQcDcVgroM7SmNuWdtyey0SP0Joztr8LIwx7mWlPm396rlUYaZkJTjHfYOB/ruNULGQ/rBP9G3S/Htu1JWsMcJLa6VKb3QTjusUkXR6WWGC16Zl7pmXdOdBK6lwc79H9YgdEcH0KcmZj/ChB+ArtM+KUz2BKw9HOa7MCXL6Zak44jhNUEl8+z9MPqm9ce3LpGx29SENfIwCSe1wTM8nCSyRaRFuyh1ZyvNKsRUW+4GqunvZszqh1IywHMegVTE/5TvgBTy16MSqX7hFaaTjjrzABxPWBjymSPxSEbH9jDwiGXaV65+2EECyYeITAwhzQF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=JWlLAkDShs4NbKy9w4Tsv8z7C/0kKMCXyw0/m3RU0iW9AOd4XuOQ0HjvWaob0tjcSilSRzkthvioLw4Vu5GlN22FV3ek5EaBCwwRVJSQsCVmVNNKA048btiNDDbUwE+eBQIop6IfCpO5Oz9m9NhTYDndgTqBXug9MCM4a4ZY5SaZx0bmF7syKLGUbKgVjdy7AWuZVVqJjHfh61TsjpVPbAF6LFxpt38JofQj1U1DMFgieBs81BbXVVGDu5U5aw/HUt7E1G5xVwljoE54slYKGaO/Do9UtKPj1/HjLB0QKC4IrOCitSPTZgWceOk+8uTCRtHjNHVFTZIh8U6ZhSMgRQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB7781.eurprd03.prod.outlook.com (2603:10a6:20b:405::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:15 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:12:15 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linuxppc-dev@lists.ozlabs.org,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH v11 05/13] dt-bindings: clock: Add ids for Lynx 10g PLLs
Date:   Mon, 13 Mar 2023 12:11:29 -0400
Message-Id: <20230313161138.3598068-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230313161138.3598068-1-sean.anderson@seco.com>
References: <20230313161138.3598068-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AS8PR03MB7781:EE_|DB8EUR05FT064:EE_|DU0PR03MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7cdd2f-2233-44a2-38ab-08db23ddb877
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: CatByxYBVCPIAFnI7vGbQovtU9mI5fHNmI1U7lDl2ZFwkvBtD8YRJqhiZmFAq/wNMfgerncg8Z5ZGlt3Q+w+jV2Vj+KFkSU2lahhgVNqaWNgaLTt4sWVN3zszUagskvluPW8/BY0ynloeuPcEALTUXC6g4fWop5GmEn4Z/uMvt/noc8GGkz96f4NVNR9KEJmbuIPiDPgtdoXw5HKYXo+quKRCxDgEu4aA3fCx0bzely5OCbtJSeejJeeRTsDLqtw3bBcapy9sZiOzrAFv1GVTft4v8qZljcW8ZYBBgrK1QsWrKlVv2OHOUCteqmacp5I/C96lAqMImuIkicEj7kKxajJ2VEknwifIqGaDovI+AcrDppysmoiAdLStNPNjTTZh4fLqbsvEba3Ou4soGLSQdOHsfL6XuhGZGYGqkwA6QGq9nkoQuVeJw9LaSCrG19dx6ELlxYnZ+pXunQXjT/I8CB4JYD9i8zIMb5J/F4yU7vXuoyXd4w1kjqSEX9fMVezmMmgGQUmQyHw3vF+nZYpPI06Dra5snYsLx9ZS28ewUDLEwq3K7GG+iq32AyJke+IgwzhawHqUiMl6T/xLgn3tf3JkNJuy5YGzDyZdpuLwztHrYicHJvi2S19m02RETICa4GIt1UlyoWzgvaw3Iaw70btvgmINW+jFlAmJffgQwT7KZwo11dSV3KQjji9H2vLxNRkQEa55ZEfe9j0p6HXYg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(346002)(396003)(376002)(136003)(451199018)(110136005)(41300700001)(54906003)(478600001)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(36756003)(86362001)(38350700002)(38100700002)(26005)(6512007)(1076003)(6486002)(6666004)(186003)(52116002)(44832011)(5660300002)(7416002)(2906002)(316002)(6506007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT064.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8841a42b-f7a7-4b5d-7479-08db23ddb5e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /JZ2uuXfdgTYjfuBfzyy0aTpj2ViXdrFPyKPBX+90KsBBndYj98Zkk2zr/1cmI99yoBteAz1id+Wkqq8leQciC+oBGjy3BWCE+P9/jpE0DGeGcOTvzEF8yNjSVzWvsJ9zK9zyvU/LQL2VMgAQskIvqzIWFb1czty1s1pqlE/70qjDQAZAIS9Jay8Z43UI1moCqVB2ktaYzgOz6TiTEa5Rr4xd8H8jiCmXn4FXV+JhpbiZPSU7yF6b3u5BHyQ57BkVyuQTimOTsntenAVCPe1ewOIW21WeX8kFeb+NPpGaA+C0ySLvPn+R4/PEuGNbxdL1D6zJ4K7C+ID4i57A9oRw3r8KDFJdzrJLhvgY7ws81/1ffixvsaY+5IZcN2lQP5SwQMdbqFrUu4tAQbvjryZo7O47FfuzkFF8OlOaRO5Mx3+VtMlgRWBb7CcBqlWDoKK+q5AdD/QSAm/gyk98Mo5ZfAIWDH0qelYV4Y66+zvt69Is8T5ztOH/lwtDeCtVj+ak8JGItSHad//Q3U7zY4uc15U2BNFedcrFtNf/phqxiNxnag4vgvf63Q+8sGUQZdy2AabyyRjl4rEX+ZIlIZ41r3JRMhq2MVR9VvexQWpez+kKNstD5VTSZpOCvCdC9BohTE0ZpnSMiuTGSzGFGDBo3Qyf73k0elJDioGurgpPqkjJD5GodGx9EZHCpXZLrJMzXvCciHkknH5kt49qFCixiT7EHjWMsJ5w3SjaFqq8/shPtzfiKpWq73Sd8rz4zPxblS7AOLcVJ3oQz3a/na8ig==
X-Forefront-Antispam-Report: CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39850400004)(346002)(376002)(136003)(396003)(5400799012)(451199018)(46966006)(36840700001)(40470700004)(2906002)(7636003)(7596003)(82740400003)(40480700001)(83380400001)(110136005)(36756003)(44832011)(7416002)(5660300002)(40460700003)(70586007)(8676002)(8936002)(186003)(41300700001)(70206006)(356005)(4326008)(316002)(36860700001)(54906003)(86362001)(34020700004)(478600001)(47076005)(6506007)(336012)(26005)(2616005)(6512007)(1076003)(6666004)(6486002)(82310400005)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:12:19.1685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7cdd2f-2233-44a2-38ab-08db23ddb877
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT064.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8289
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

