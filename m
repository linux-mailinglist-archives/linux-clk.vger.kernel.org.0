Return-Path: <linux-clk+bounces-3466-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B4584E472
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 16:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D96C62860AA
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 15:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9447D3EB;
	Thu,  8 Feb 2024 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ku88jgjg"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2177D3E4
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707407759; cv=none; b=HliwVY+aZltj1rgBcF8OODO4/LSFp00j6Lw6SePlvlg7AuH57mUKmmc+KoXf695uMzBKm9CKXEfc43fcl71ZMWbwzQmOZhjNXo7ApbFXA4RFKzNtokh/UIqShgnwogYivRuJn8nwYz7huqYW4zk4nEQoPBN5zwGtkeekUssuBqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707407759; c=relaxed/simple;
	bh=VxRJGKaYXSRYdovy63fzI0ASEaNdAGwALPigMzGJrG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsShKf0KJ6mEVfGn3IOPVvrR1lgT55CyM9sbz61YUjpzmWh3XuliseiNawvzA14ClkphTvppGzJnHBYCM3itfqEkTaKv0sPQ4T8GwjU4lH/806kLAFqKCA22fmgtxRGdZZGIeAxQA0Pkyg14NMXQ8snvCJt8T/IqMYuTUbIfLPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ku88jgjg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33b13332ca7so1104617f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Feb 2024 07:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707407756; x=1708012556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jwj187v5DmD95irFdBgTanplv+ZSPDewhhqQqZrj+18=;
        b=Ku88jgjgigv/7hXHH5pvyCXBDd7haFMI+DznB49JMHo/JZO2YfqIkQRE/+1EOKBSK3
         kFwBZOI8Jq/mjZsGqzBqiskJBuZGWYlsFxInR719+tDZYC/ZrOwJTItoA8q4a76+jVmh
         WxkKJmWwXUc3YypNRyULcjDUy24pM0twQ5SjHQZY3rCb2SMEkVfbaGyH3709Z19tQTkJ
         HL/32NjTTBvLgLgziQmNRD79A4TQQy6CNFwCYOXOS+1pRXog5YmsNqhOv9ig+DrpzjkI
         aD6r5Mwsta0Z91tWLkjAY0woYrAXlm/3o20FasAhSgSv1ncs5qC2wBOMuV2Imc9R6Qj2
         l2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707407756; x=1708012556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwj187v5DmD95irFdBgTanplv+ZSPDewhhqQqZrj+18=;
        b=neZiynOk951vZWs905nMQu00cnWk2CCTyIj9QV9aG5thLo9qL1ZfnwUF7sdTD6WzpB
         rkbjq4JJUu0ON3+8qMfbJ1yZCwnZ0Wtboma90tA3wGhfjFju9J9XD8W915avGoYajh0D
         7olRLmZ3MmgpOVeH959/L4lBILKXhhxA5u9SeVPKpeoVUBlfdhMkyqhBD+2LBf7uGhL4
         daHwV/q4Z4aFEWXTj4iZwOl9yDkdVvROyex+k5UdTjVAvmnM3FhcSAN/Tr42pZnA2RYo
         AuiGI0h+Da3EYcXv7/JkIf+ycPn2AAv1VNTa/3CBu33tMYvGh9d9pYAuHBZ5A7hmm3Ve
         BhYw==
X-Gm-Message-State: AOJu0Yw/PwAVxZTESAATOowMgfG1Ew7ceTRvTAFvLv73GSC9P7Dd0Txg
	n3HLooTuTcwcWAyPGKNKjA2MG2evNNAHdcRK1f/ACdywcEJ2HSZYgqARKD7iVZA=
X-Google-Smtp-Source: AGHT+IFfdq3GR+jNAtlGIoRDXvcR8MQLIIZqMZPsMrgv6b4NoWs3p8MQUDAlqRR3ToqtEy/wPcKNIg==
X-Received: by 2002:a5d:4dcc:0:b0:33b:4d13:3e91 with SMTP id f12-20020a5d4dcc000000b0033b4d133e91mr3820391wru.45.1707407756251;
        Thu, 08 Feb 2024 07:55:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULtDWAiTDbRxR7h0kvcsiu+OwZWCxku0b5SYZAaErDiFKeCuOOEqPUGLCtZgOuCtf8Ip8AbJdxJssk7bBOvR3rBCFEgHHjk2EYqEyBNOoBHo5KhtPaw9ZubnDqy5qaaePhYqDWQaoGgWY2JjEIPecqTMFop0/ZLyoCjIZ7KFaYo4dsW7LP3+CmmpalQje2sv1+lnZkGXX4bseVubc+J8Ius9BpkVWiCN/Ju0Fnw50gR2O/U13W6a+T7sJGHU28QuhAPqT1fLAp3DtFBMJCeSk6wWkwon1PZgYBm/lvKAUwYEUlmsRwZorlOWqlGaYxenBRQqZERJ3QZ7PFihZ4Mh6Id0bMDxzgRREJC/x3YR7pmrn3yU6Y7138sx4gwvJJ6DeyuC4Xf0d/zuu/HD0NBfPWt62HdnQdGoBpM7OP1ifpDE+M/aZR8SPVf/FUN07kd8JpQHQSAIsB8bzUfTS0AsK/y5hHU1Gnw2aXnsbsraqBpD0aKw7loIPDQOQWjrNrzG3X5wZgvEmlEYHhNlmzKcZHNWO5g5w+eQO23Gwg6TrsHQyOEda3pdXae2MPThgDDRiw2tIdPPkZB1+1sgQcH+ch5DIzgBVaEegH
Received: from [192.168.50.4] ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id m25-20020a056000181900b0033b4235b155sm3852770wrh.48.2024.02.08.07.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 07:55:55 -0800 (PST)
Message-ID: <0e45aef2-5fc5-4677-9370-b9e565f0767b@tuxon.dev>
Date: Thu, 8 Feb 2024 17:55:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] dt-bindings: clock: r9a07g044-cpg: Add power domain
 IDs
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-3-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB1126925EE70DA30AC2662862686442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB1126925EE70DA30AC2662862686442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 08.02.2024 16:39, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Thursday, February 8, 2024 12:43 PM
>> Subject: [PATCH 02/17] dt-bindings: clock: r9a07g044-cpg: Add power domain
>> IDs
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add power domain IDs for RZ/G2L (R9A07G044) SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  include/dt-bindings/clock/r9a07g044-cpg.h | 58 +++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>
>> diff --git a/include/dt-bindings/clock/r9a07g044-cpg.h b/include/dt-
>> bindings/clock/r9a07g044-cpg.h
>> index 0bb17ff1a01a..e209f96f92b7 100644
>> --- a/include/dt-bindings/clock/r9a07g044-cpg.h
>> +++ b/include/dt-bindings/clock/r9a07g044-cpg.h
>> @@ -217,4 +217,62 @@
>>  #define R9A07G044_ADC_ADRST_N		82
>>  #define R9A07G044_TSU_PRESETN		83
>>
>> +/* Power domain IDs. */
>> +#define R9A07G044_PD_ALWAYS_ON		0
>> +#define R9A07G044_PD_GIC		1
>> +#define R9A07G044_PD_IA55		2
>> +#define R9A07G044_PD_MHU		3
>> +#define R9A07G044_PD_CORESIGHT		4
>> +#define R9A07G044_PD_SYC		5
>> +#define R9A07G044_PD_DMAC		6
>> +#define R9A07G044_PD_GTM0		7
>> +#define R9A07G044_PD_GTM1		8
>> +#define R9A07G044_PD_GTM2		9
>> +#define R9A07G044_PD_MTU		10
>> +#define R9A07G044_PD_POE3		11
>> +#define R9A07G044_PD_GPT		12
>> +#define R9A07G044_PD_POEGA		13
>> +#define R9A07G044_PD_POEGB		14
>> +#define R9A07G044_PD_POEGC		15
>> +#define R9A07G044_PD_POEGD		16
>> +#define R9A07G044_PD_WDT0		17
>> +#define R9A07G044_PD_WDT1		18
>> +#define R9A07G044_PD_SPI		19
>> +#define R9A07G044_PD_SDHI0		20
>> +#define R9A07G044_PD_SDHI1		21
>> +#define R9A07G044_PD_3DGE		22
>> +#define R9A07G044_PD_ISU		23
>> +#define R9A07G044_PD_VCPL4		24
>> +#define R9A07G044_PD_CRU		25
>> +#define R9A07G044_PD_MIPI_DSI		26
>> +#define R9A07G044_PD_LCDC		27
>> +#define R9A07G044_PD_SSI0		28
>> +#define R9A07G044_PD_SSI1		29
>> +#define R9A07G044_PD_SSI2		30
>> +#define R9A07G044_PD_SSI3		31
>> +#define R9A07G044_PD_SRC		32
>> +#define R9A07G044_PD_USB0		33
>> +#define R9A07G044_PD_USB1		34
>> +#define R9A07G044_PD_USB_PHY		35
>> +#define R9A07G044_PD_ETHER0		36
>> +#define R9A07G044_PD_ETHER1		37
>> +#define R9A07G044_PD_I2C0		38
>> +#define R9A07G044_PD_I2C1		39
>> +#define R9A07G044_PD_I2C2		40
>> +#define R9A07G044_PD_I2C3		41
>> +#define R9A07G044_PD_SCIF0		42
>> +#define R9A07G044_PD_SCIF1		43
>> +#define R9A07G044_PD_SCIF2		44
>> +#define R9A07G044_PD_SCIF3		45
>> +#define R9A07G044_PD_SCIF4		46
>> +#define R9A07G044_PD_SCI0		47
>> +#define R9A07G044_PD_SCI1		48
>> +#define R9A07G044_PD_IRDA		49
>> +#define R9A07G044_PD_RSPI0		50
>> +#define R9A07G044_PD_RSPI1		51
>> +#define R9A07G044_PD_RSPI2		52
>> +#define R9A07G044_PD_CANFD		53
>> +#define R9A07G044_PD_ADC		54
>> +#define R9A07G044_PD_TSU		55
> 
> Not sure these PD id's can be generic and used across all RZ/G2L family
> devices and RZ/V2M?

That may be another approach. I chose this one to have everything SoC
specific in a single place. With this, e.g., we can have all the SCIF
related IDs grouped together (as we know from the beginning how many SCIF
blocks a SoC has):

+#define R9A07G044_PD_SCIF0		42
+#define R9A07G044_PD_SCIF1		43
+#define R9A07G044_PD_SCIF2		44
+#define R9A07G044_PD_SCIF3		45
+#define R9A07G044_PD_SCIF4		46

If a single file with all the IDs for all the SoC will be used then, as
every SoC will have a different number of SCIFs, I2Cs, RSPIs, to keep the
DT binding backward compatibility, we will end up with these IDs not being
grouped on functionality, e.g., we may end up with something like:

+#define R9A07G044_PD_I2C0		38
+#define R9A07G044_PD_I2C1		39
+#define R9A07G044_PD_I2C2		40
+#define R9A07G044_PD_I2C3		41
+#define R9A07G044_PD_SCIF0		42
+#define R9A07G044_PD_SCIF1		43
+#define R9A07G044_PD_SCIF2		44
+#define R9A07G044_PD_SCIF3		45
+#define R9A07G044_PD_SCIF4		46
+#define R9A07G044_PD_SCI0		47
+#define R9A07G044_PD_SCI1		48
+#define R9A07G044_PD_IRDA		49
+#define R9A07G044_PD_RSPI0		50
+#define R9A07G044_PD_RSPI1		51
+#define R9A07G044_PD_RSPI2		52
+#define R9A07G044_PD_CANFD		53
+#define R9A07G044_PD_ADC		54
+#define R9A07G044_PD_TSU		55

+#define R9A07G044_PD_SCIF5		56
+#define R9A07G044_PD_SCIF6		57
+#define R9A07G044_PD_I2C4		58
+#define R9A07G044_PD_RSPI3		58
+#define R9A07G044_PD_RSPI4		59

Of course, I can adjust it if Geert wants it differently.

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju
> 
>> +
>>  #endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */
>> --
>> 2.39.2
>>
> 

