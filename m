Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198F53580FD
	for <lists+linux-clk@lfdr.de>; Thu,  8 Apr 2021 12:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhDHKlY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 8 Apr 2021 06:41:24 -0400
Received: from mail-mw2nam12on2059.outbound.protection.outlook.com ([40.107.244.59]:55296
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229741AbhDHKlX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Apr 2021 06:41:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ax3EtgzrlR6mdhUloRVxrUig+ocGX+dpjLqCSR2PyTf2edQTmzp8utjxoRg0HmNWWgh+ln8p6Ay8BDnv3rxu9NuEtj2OjTMKefgucib+R+doVtMDJ2ds47znJXIrbsuzUp9wJsg7+t+Ui0JYoBuJ7CyiWmVxp9TmnBOFuRRYUMiwCGxp7A/qQ3aoRWzinPMJb1tpc9CGUU4MjpVqIs3UjOf5qAEdnJgy7NRRmE60PZZuzzegK9zpp3rFPf83n0Mn3vxvwK1crfPFXW0AenX+vXfcJbUIgwTOSoYSs0j+Yo7SJwoVQFdARP4d0gsgNdcRW3RWkvChEdF7PEDW5hem4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhLD0zQDUxEj498C5WjI0lbAUxmA86UWzWhskvCGBuE=;
 b=cl/nh4GfrgOF0CBLiKHsXzipjoeEGNGjdJUVjOZfDHeVSBEnvrL5EgHh/Xma7YZcU4mDsv1xDaiMj5Euu+dKeyAw/BkfBZ1q1tUfhG3q0AN+1UvgG54BfUsFT0B58mY/hS+LeI8YRvWbHUmeDCSsuUnlD8Tr9QTDg8rZaFkBZQQqGPrAAsrnb+CF/Cw7I4KSM9nbA0hvO17zBErZpswQJLWZ+qqfiaublhuNr02PCZSmSg2rJ64u6asTNJnVOy0ATVudfpQ6RlBI19AEPNogyPeIfuClMdLCEJQNSJev9NkLyiEY/alltyEhc2A1pHjekXOLeln2VP8luI0cBIJkZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=driverdev.osuosl.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhLD0zQDUxEj498C5WjI0lbAUxmA86UWzWhskvCGBuE=;
 b=Fn3uQhXu/I3143YGNnaunZAtJLcgmLMRvOfSD5yWasrXe2ZcFBcBcSwJ6WGEKhbnjDtYhG/Y0SWqlnv2dRlKQaCuGJwdnO4L50dJpmfCK3ABGJarMibCemL2d8i+piALdu5kz1hQ5EnYhjnNH2PQqi1RYb9wcdGdFyjZ0WQTJZ4=
Received: from BL1PR13CA0141.namprd13.prod.outlook.com (2603:10b6:208:2bb::26)
 by SN6PR02MB4206.namprd02.prod.outlook.com (2603:10b6:805:2b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 10:41:09 +0000
Received: from BL2NAM02FT054.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2bb:cafe::be) by BL1PR13CA0141.outlook.office365.com
 (2603:10b6:208:2bb::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.8 via Frontend
 Transport; Thu, 8 Apr 2021 10:41:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; driverdev.osuosl.org; dkim=none (message not
 signed) header.d=none;driverdev.osuosl.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT054.mail.protection.outlook.com (10.152.77.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 10:41:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 03:40:36 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 03:40:36 -0700
Envelope-to: git@xilinx.com,
 devel@driverdev.osuosl.org,
 miquel.raynal@bootlin.com,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 gregkh@linuxfoundation.org,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 robh@kernel.org,
 shubhrajyoti.datta@gmail.com
Received: from [172.30.17.109] (port=37140)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lUS5T-0000oH-8b; Thu, 08 Apr 2021 03:40:35 -0700
To:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>,
        Rob Herring <robh@kernel.org>
CC:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>, <git@xilinx.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        <devel@driverdev.osuosl.org>
References: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1614172241-17326-9-git-send-email-shubhrajyoti.datta@xilinx.com>
 <20210306202022.GA1146983@robh.at.kernel.org>
 <CAKfKVtF8FAAt-Rszq62hBtJWokYXrKH_DwU1cGvXzBni99VM+A@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v10 8/9] dt-bindings: add documentation of xilinx clocking
 wizard
Message-ID: <14254feb-ddbd-068d-74a4-61407177336d@xilinx.com>
Date:   Thu, 8 Apr 2021 12:40:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAKfKVtF8FAAt-Rszq62hBtJWokYXrKH_DwU1cGvXzBni99VM+A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ccb3720-982f-4898-ef0b-08d8fa7ad22b
X-MS-TrafficTypeDiagnostic: SN6PR02MB4206:
X-Microsoft-Antispam-PRVS: <SN6PR02MB420665F0A3EAA67D349D7FD8C6749@SN6PR02MB4206.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8xIToDMHsVAwcnDZ1c3z2CvXL3k7w5ha56Ox4Bl8MbVi/+brXUgNJyvHAgQvnlTJCURBI07vlB4IurA3gZ/xWgVI7xsVLkOc4i4C+QfibonwSASLScwtGh9Fp2ISaX/eID9tHCZ8G8bqlSINPxFfA4gFmsX/LatwoyWZNCZ+I1tefvtZV3T5lNYrIVMI9dlqR0AKc5qzMqX+Ty8fd/nOJZL3oNqNT/iCC8qfoxZe3hujcn0KJ2lKOCP2N2W0K8a8B5/XBQ2FMsxaPc2zv4F08Sr87XJMLevjqT1TmIo36Vwan4kSq4n7T2MKH81hoGidtpIJAviPBkqDUuPW8T21JCNwey5xQnHwJbN8prJBGLT5iI8HwUHVqflm0TBseF8shJEnf7BLGdo05/Spub6eZivbogLurbaSGQ+XOW82MXCipFwrLSHvf3bTCM+XDOOlvaISJdNpFeYmJtmUB5PMN4UQolWZc/cXz+IECd7bvg4rzNTv+7S4MkyNe3rYLZbardpNwOSnZNRDYqFfxMIg3tjtC0yuUjp60K/q29YApV4W+BBbXgqtlmFgtPDV5tQzA5whelnq3GatDNjxpSbnGbpXfmjWXRtgJq8np17gEu/yAivNObtndlaO++Qb1XJFM2nw49RDB0OruwT0iiuAnN7TEDRYED30TTuaUcp79hnlZf4/13KVuwFP+YjsVeCMDBIxl7d4icQwB5CJ/4m6zuyjoMjgybtLTZVKhvUCiDHa9/+IfoHV+8EXNw3aC0n3PPYxT/Xoldb+V8SdAa05qYqp0W0eGUi7orqteHimoBg=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(36840700001)(46966006)(31686004)(83380400001)(4326008)(82740400003)(426003)(2906002)(7636003)(70586007)(70206006)(44832011)(356005)(8676002)(54906003)(26005)(8936002)(47076005)(36756003)(36860700001)(31696002)(186003)(336012)(36906005)(478600001)(53546011)(6666004)(9786002)(5660300002)(82310400003)(110136005)(2616005)(316002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 10:41:09.0556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccb3720-982f-4898-ef0b-08d8fa7ad22b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT054.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4206
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 4/8/21 12:26 PM, Shubhrajyoti Datta wrote:
> On Sun, Mar 7, 2021 at 1:50 AM Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, Feb 24, 2021 at 06:40:40PM +0530, Shubhrajyoti Datta wrote:
>>> Add the devicetree binding for the xilinx clocking wizard.
>>>
>>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>>> ---
>>>  v6:
>>>  Fix a yaml warning
>>>  v7:
>>>  Add vendor prefix speed-grade
>>>  v8:
>>>  Fix the warnings
>>>  v10:
>>>  Add nr-outputs
>>>
>>>  .../bindings/clock/xlnx,clocking-wizard.yaml       | 72 ++++++++++++++++++++++
>>>  1 file changed, 72 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>>> new file mode 100644
>>> index 0000000..280eb09
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>>> @@ -0,0 +1,72 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/clock/xlnx,clocking-wizard.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>> +
>>> +title: Xilinx clocking wizard
>>> +
>>> +maintainers:
>>> +  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>>> +
>>> +description:
>>> +  The clocking wizard is a soft ip clocking block of Xilinx versal. It
>>> +  reads required input clock frequencies from the devicetree and acts as clock
>>> +  clock output.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: xlnx,clocking-wizard
>>
>> Not very specific. Only 1 version of this h/w?
> 
> Will fix in next version
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#clock-cells":
>>> +    const: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: clock input
>>> +      - description: axi clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: clk_in1
>>> +      - const: s_axi_aclk
>>> +
>>> +
>>> +  xlnx,speed-grade:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [1, 2, 3]
>>> +    description:
>>> +      Speed grade of the device. Higher the speed grade faster is the FPGA device.
>>
>> How does one decide what value?
> This is a property of the FPGA fabric.
> So  hdf/xsa  should tell that

Shubhrajyoti: Rob likely doesn't know what hdf/xsa is that's why it is
better to avoid it.

fpgas/pl part of SoC are tested for performance and different chips have
different speed grades. This is done for every chip and some chips are
faster/slower. Based on this speed grade is labeled. And there is no way
how to find at run time which speed grade your device has. That's why
there is a need to have property to identify this.

In designed tools it is your responsibility to select proper chip based
on your order and then this value is propagated in Xilinx standard way
via device tree generator to fill the right value for this property.

Thanks,
Michal
