Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CD62FED33
	for <lists+linux-clk@lfdr.de>; Thu, 21 Jan 2021 15:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729940AbhAUOoB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Jan 2021 09:44:01 -0500
Received: from mail-co1nam11on2061.outbound.protection.outlook.com ([40.107.220.61]:52433
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731956AbhAUOm1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Jan 2021 09:42:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3bOjqiT4BxGOVcAXphV8wiDgC4WLyoqAsqtxjod+X8LIfq7WgmYpQPOV2msNJYfkAQb1KytRIaO9QPlHHC5IhMvi6fUFP9dg0NLQi7exdExCeHOJMU5b0nRdP2I9A+RWDNnJUnFNncjk510broT2KcMpFj88f0AdOYHLVGn7FjzQRE430YpUrmPdKl0Ta0mmrcOdtkhvnVYLo8MKzFFnoxR1SMIXcYRB/GDmCoE0Yuz3nG9TjIzKUyVBR9HAQ5JGksekzB2VAjPnMAXnYThIzfHE26IgelI9bh/AvF5BW0r6SkA4nBlPkNF5qBJPNLTFO2yKpMbVESEzqYN0x8HaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COWfR5dIG0PcoDffPwRFXLaDG7fOA/Iidqhg4ve3USA=;
 b=h8JtQxN3rEBLz77CMAC32BV9d9kH2bcG8Y5/z+v1wDdOvtTzhifP40bMByTiE6IsgbvNvRy0z22TzaRd3QvPrexEO7P6u++sGdv2e1qgpsT2LrJPwI4+xHk6+KtQ+63DDE5eAciKK5P0Mpjz4pHGOHPHwscJQAul4oj7h6dT/gEAfz2XF1gnt2ofCZgBvGPGyepdKLw9aMTOF3HKmBbMkCEsu7Av0P+AOoMw/gxeeTO2FHPwvFTfBOBlAAYRQtKXk70sh9NYA8+9IbbbpRH+viOUJeYb3sGhdSoddO8ZeqZSduo/h3LxCzzuuBg/QqvaA2VG1rJTZOYaT9Dq1pYQnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COWfR5dIG0PcoDffPwRFXLaDG7fOA/Iidqhg4ve3USA=;
 b=VPqjzYTr62g1fwSnZYiiKcPl+QNyb0tZM0H5peNkEwUkbRD4jdurWNMGQUk0MZ4R8au4iAAwtFfgyPTYcJ5/VGMwCfDd5Oy5tFa8ny8po04d9ruhHwG6Xx1hj27AiJXp1jilMwnT3+mKDthKvl9SjIbUUsKlSEwHm2sbSUa3WKA=
Received: from DM6PR14CA0059.namprd14.prod.outlook.com (2603:10b6:5:18f::36)
 by BYAPR02MB4645.namprd02.prod.outlook.com (2603:10b6:a03:5f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 21 Jan
 2021 14:41:08 +0000
Received: from CY1NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::be) by DM6PR14CA0059.outlook.office365.com
 (2603:10b6:5:18f::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Thu, 21 Jan 2021 14:41:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT042.mail.protection.outlook.com (10.152.75.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 14:41:06 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 21 Jan 2021 06:40:36 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 21 Jan 2021 06:40:36 -0800
Envelope-to: git@xilinx.com,
 mturquette@baylibre.com,
 gregkh@linuxfoundation.org,
 devicetree@vger.kernel.org,
 devel@driverdev.osuosl.org,
 monstr@monstr.eu,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org
Received: from [172.30.17.109] (port=41420)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1l2b8U-0002zb-Ty; Thu, 21 Jan 2021 06:40:35 -0800
Subject: Re: [PATCH v7 0/7] clk: clk-wizard: clock-wizard: Driver updates
To:     Stephen Boyd <sboyd@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-clk@vger.kernel.org>, Michal Simek <monstr@monstr.eu>,
        Srinivas Goud <srinivas.goud@xilinx.com>
CC:     <devel@driverdev.osuosl.org>, <devicetree@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <mturquette@baylibre.com>,
        <git@xilinx.com>
References: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <160783777786.1580929.1950826106627397616@swboyd.mtv.corp.google.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <44e71db0-efa6-703c-c83b-c39492bf5dcd@xilinx.com>
Date:   Thu, 21 Jan 2021 15:40:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <160783777786.1580929.1950826106627397616@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d47f3fd3-a5cf-4647-222a-08d8be1a95af
X-MS-TrafficTypeDiagnostic: BYAPR02MB4645:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR02MB4645AB7BF00DF3F110C6F199C6A10@BYAPR02MB4645.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLvW0888lVPtuM2+apwg6Y6nQ0XX1Op6rbvqtA9pOKD1DWJCv8J3ccuqIGqvQ0l3bF+EngrkDa+7Z35gf7ncJFCOKO9hUwJF77eLghRUsYue5zqRrNpQp7sAP7TXfqiN3Fl4ftKvbI1IoiT4ss64N8Yn9JMuME4MImXbaMatw3yxUzCH359JjIPo1NYd+5ZQ1FdnRTPr3q1neMzT3Q8mv2tMDAHMV5+KtcHPdeOLIz1J7OFTjGIsT1nSt597uZvxWJkOD3QJkwagVFcwjQRc/k3GlixAp29HrOumFtRdDqvoE++szzRIBsOpS2kATmb7OsRYCoMsug+HEbzFvOlgdC5KjdDQztbz7B6fXNQdcM/PMwUEOVgvOl4RkFJgXvxzjQu2RvpyQSxe2tUbo55RmBj8/jS0hBCgrsf3XP6vJXq2yWwMdXebh7tw009hvA6XavmUm8sUGeNV4nyCptgTXB4SahN1N2MVxtNazg9F5wpNNlaL807VLq/I8YlTyC22lG739ZTA8h9TWXahurnoHPOl7FqfOVHwAON0TFypMBnlnQtjl4XHNyMiJAlmFU9uRcL0poSwJz08tD4ixcwo1guN52Bgc6yZ8f4wOeGt/M0=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966006)(54906003)(53546011)(107886003)(36906005)(8936002)(5660300002)(31686004)(4744005)(6666004)(9786002)(82740400003)(47076005)(110136005)(36756003)(2906002)(7636003)(356005)(31696002)(4326008)(316002)(70206006)(44832011)(83380400001)(426003)(966005)(6636002)(26005)(478600001)(8676002)(2616005)(336012)(70586007)(82310400003)(186003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 14:41:06.2005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d47f3fd3-a5cf-4647-222a-08d8be1a95af
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4645
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

First of all sorry for very slow response. I didn't get this email even
xilinx alias is in CC. Something is really fishy here.

On 12/13/20 6:36 AM, Stephen Boyd wrote:
> Quoting Shubhrajyoti Datta (2020-11-04 07:06:40)
>>
>> Shubhrajyoti Datta (7):
>>   dt-bindings: add documentation of xilinx clocking wizard
> 
> Any chance to respond to Robs comments?

I will ensure that Rob's comments are addresses.

> 
>>   clk: clock-wizard: Add the clockwizard to clk directory
> 
> Is it called 'wizard' anywhere in the documentation? I wonder if there
> is a better name that could be found for this.

It is really clocking wizard based on documentation.
https://www.xilinx.com/support/documentation/ip_documentation/clk_wiz/v6_0/pg065-clk-wiz.pdf

Can you please review that 6 patches if there is a need for any change
for v8?

Thanks,
Michal
