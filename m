Return-Path: <linux-clk+bounces-11633-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D27969563
	for <lists+linux-clk@lfdr.de>; Tue,  3 Sep 2024 09:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EA23B2216E
	for <lists+linux-clk@lfdr.de>; Tue,  3 Sep 2024 07:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57791D6DAB;
	Tue,  3 Sep 2024 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TggNyvfa"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5951D6C77
	for <linux-clk@vger.kernel.org>; Tue,  3 Sep 2024 07:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348515; cv=none; b=YChy39Bctg9UrtAD78Y/FN0vp59COOTLC3rYSYvnoh7reoP5vt5EEoCetO8JhDUTZUEFYq7XM/S4mAUQ80J14SRUuRqlrVJQlwdP2DOwGxThK2klxMLGnU3hpsu89FkHUX7ZpqLQQCLvW5BlG67e7aT65GV1rdiDh6VgKVgBrQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348515; c=relaxed/simple;
	bh=fhs9ljhTluEeCofi3Q/UFBFLbvVKPa3FiMv+z4xC+jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATZi2RyAfia6Vv56CYw4VtkKiK8dpa9hwxPd5NmjO+JkWk3ijzPmBwrHm/OwXYnm5cieBmkQ7RkST3Su1WCZaOTfKauAg9kT/c2uw4Jzqjlg+vJvnxf5oONRV++llc2e3ND2Q+zME/zf0R05DvVvBhRVoIMd49e1/wMsf5wgagI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TggNyvfa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428e1915e18so41312255e9.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Sep 2024 00:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725348511; x=1725953311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/99gE9FKzn1v1GzAjvpqA+MvSmAnqV4n4m1JlDYUvw=;
        b=TggNyvfaLlHsi5RAI8osyuwBc7sXZK2paLsu3vdmzE5Zct3XDJ6CBstN0zO95GQAnw
         ymfXEp8F/1V6EkUUkFHDrYGPYDovJmdSNcWvB4KeTHD3/lxV1j5t+7+VqB0FOFuSWupH
         8URARN40CRWXnlZhwkJ94qYv+C/3G2I8Wh+Xh3wld7lACEMauivuru93dYsr2JTew/+v
         dJaf3XK68xvD37Hj7rok2CwMEIgMf7wz9FvxZEhWoLyyGF+Rnqe9sAonmyLz21Pizj2R
         /RJTim1LPhN44z4kfeDIBiKUAtYS228UiH3te9kksK6yp1pPMMlU0u58pkpgjysziR6o
         fbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725348511; x=1725953311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/99gE9FKzn1v1GzAjvpqA+MvSmAnqV4n4m1JlDYUvw=;
        b=jT2OcMg6/BRf/5XfApbk6VkFFzbbTMvzdoZS7uhmK1oWx7cRzbmqixhEL9sMqa8aGZ
         lI4/74NNtBSaa9qa/UkymXuJejXej2E3Ky8ZNJ1Cx6kAu6aDlzm6qC7VQXxQuQYfHuTb
         rCbq/E4RZlVZy8s6btUXPAzwMKQFOvmpPZUlKLyiw/CkRGdWEsvHzTHXR1mUkWiAhn1u
         glm7IlJHsXzpzSZ8y+fyMx6/Iu8Q5iNlFWqqZst12kOp+A3BoJlg4gBJPKUmU8xk0rBO
         jJeveZ5Fcrx1ex4ybfgXZpNLEsqTZArohN3i4h9c9lXhYy089Nf6g479DlfobkdGq1pA
         lKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8oaMBe12SK+HCFrrbyux3csM1dcZUXDiFY3btoyfX/nZ6NvBNJYcoJw/0mZ3Yee9SOzhFoducVmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFBgqtVU3Vc9XJNIPiwgd22qT/+g+RtCwrqXPsdYW20LP26mUt
	PxW/bO1dp9UB5dR4rZjXk8mpO5idZhFNWR2e8kd1/bqofOTGYJQ+omuXt/nf5PM=
X-Google-Smtp-Source: AGHT+IFPdKSDwq2svM7AfN9p8jSbfkjJposupx9wGXez9ihUncQIuTAN9qQadaTGHwSVurVmNM9Yow==
X-Received: by 2002:a05:600c:1ca1:b0:426:5cdf:2674 with SMTP id 5b1f17b1804b1-42c7b59e433mr70256085e9.4.1725348511256;
        Tue, 03 Sep 2024 00:28:31 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb73e20b7sm161574845e9.14.2024.09.03.00.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 00:28:30 -0700 (PDT)
Message-ID: <54d60105-ee5b-48da-92f4-2bcb3dff5c92@tuxon.dev>
Date: Tue, 3 Sep 2024 10:28:28 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346D59E486D88611E8F254F86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346D59E486D88611E8F254F86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03.09.2024 09:58, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Friday, August 30, 2024 2:02 PM
>> Subject: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC, the tamper detector and a small
>> general usage memory of 128B. Add documentation for it.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - moved the file to clock dt bindings directory as it is the
>>   only functionality supported at the moment; the other functionalities
>>   (tamper detector, SRAM) are offered though register spreaded
>>   though the address space of the VBATTB IP and not actually
>>   individual devices; the other functionalities are not
>>   planned to be supported soon and if they will be I think they
>>   fit better on auxiliary bus than MFD
>> - dropped interrupt names as requested in the review process
>> - dropped the inner node for clock controller
>> - added #clock-cells
>> - added rtx clock
>> - updated description for renesas,vbattb-load-nanofarads
>> - included dt-bindings/interrupt-controller/irq.h in examples section
>>
>> Changes in v2:
>> - changed file name and compatible
>> - updated title, description sections
>> - added clock controller part documentation and drop dedicated file
>>   for it included in v1
>> - used items to describe interrupts, interrupt-names, clocks, clock-names,
>>   resets
>> - dropped node labels and status
>> - updated clock-names for clock controller to cope with the new
>>   logic on detecting the necessity to setup bypass
>>
>>  .../clock/renesas,r9a08g045-vbattb.yaml       | 81 +++++++++++++++++++
>>  1 file changed, 81 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
>> b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
>> new file mode 100644
>> index 000000000000..29df0e01fae5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.y
>> +++ aml
>> @@ -0,0 +1,81 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/renesas,r9a08g045-vbattb.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas Battery Backup Function (VBATTB)
>> +
>> +description:
>> +  Renesas VBATTB is an always on powered module (backed by battery)
>> +which
>> +  controls the RTC clock (VBATTCLK), tamper detection logic and a small
>> +  general usage memory (128B).
>> +
>> +maintainers:
>> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: renesas,r9a08g045-vbattb
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: tamper detector interrupt
>> +
>> +  clocks:
>> +    items:
>> +      - description: VBATTB module clock
>> +      - description: RTC input clock (crystal oscillator or external
>> + clock device)
>> +
>> +  clock-names:
>> +    items:
>> +      - const: bclk
>> +      - const: rtx
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
> 
> Not sure, you need to document "PD_VBATT" power domain 
> as per Table 41.2, this LSI supports 3 power domains(PD_ISOVCC, PD_VCC, PD_VBATT)
> 
> Power Mode PD_ISOVCC PD_VCC PD_VBATT
> ALL_ON      ON          ON    ON
> AWO         OFF         ON    ON
> VBATT       OFF         OFF   ON
> ALL_OFF     OFF         OFF   OFF
> 
> PD_VBATT domain is the area where the RTC/backup register is located, works on battery power when the power of
> PD_VCC and PD_ISOVCC domain are turned off.

In Linux, the CPG is the power domain provider for all the IPs in RZ/G3S
SoC (modeled though MSTOP CPG support). This is how it is currently
implemented.

Then groups of IPs are part of power domains PD_ISOVCC, PD_VCC, PD_VBATT.
These power domains are i2c controlled with the help of firmware (at least
at the moment).

From HW manual:
- PD_VCC domain always powered on area.

- PD_ISOVCC domain is the area where the power can be turned off.

- PD_VBATT domain is the area where the RTC/backup register is located,
  works on battery power when the power of
.

The power to these domains are controlled with the help of firmware. Linux
cannot do control itself as the CPU is in the PD_ISOVCC. If you look at
picture 41.3 Power mode transition [1] it is mentioned the relation b/w
these power domains (controlled by PMIC though firmware) and the supported
power saving modes: ALL_ON, AWO, VBATT.

Thank you,
Claudiu Beznea

[1] https://pasteboard.co/4ureEUnyCfV8.png

> 
> Cheers,
> Biju
> 
>> +
>> +  resets:
>> +    items:
>> +      - description: VBATTB module reset
>> +
>> +  renesas,vbattb-load-nanofarads:
>> +    description: load capacitance of the on board crystal oscillator
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [ 4000, 7000, 9000, 12500 ]
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
>> +  - power-domains
>> +  - resets
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    vbattb@1005c000 {
>> +        compatible = "renesas,r9a08g045-vbattb";
>> +        reg = <0x1005c000 0x1000>;
>> +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
>> +        clock-names = "bclk", "rtx";
>> +        #clock-cells = <1>;
>> +        power-domains = <&cpg>;
>> +        resets = <&cpg R9A08G045_VBAT_BRESETN>;
>> +        renesas,vbattb-load-nanofarads = <12500>;
>> +    };
>> --
>> 2.39.2
>>
> 

