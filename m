Return-Path: <linux-clk+bounces-21001-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 699C8A9A9DD
	for <lists+linux-clk@lfdr.de>; Thu, 24 Apr 2025 12:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3715444D02
	for <lists+linux-clk@lfdr.de>; Thu, 24 Apr 2025 10:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45CE22170B;
	Thu, 24 Apr 2025 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPLs56kN"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DDD200B99
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489840; cv=none; b=Becrhxy4XGq/gfIDdNOGNmTVWCGUXP2aceiyS44bIwsdbkP1+a+MGi74QMuUfMCA4TpfAivo0ZbujB56IqhTxLISF6c8+eZJgLFIFcyO9EyJautjyoM1Ic+BObx+as0BZMvDEqARi1xg5AtF4rxGRk6QUsI6EYea5++OFPfA4oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489840; c=relaxed/simple;
	bh=JgxDASSoJfH/+WDmK4aXcaHmUCS+QeddplH3cTE41pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InY/w0+9owFcpL6X7n2SotWoLjZuQh0L9xj5vamGcpOgWcOfhvIa/rrv+Sw1AGnQlpLTeLtEM7m1lqixWG0CE6qDrE1y8s04pGeD2NuZH+Sr+tEZhgqKa2ADF5/jvDd07f52hnflw41uq0c2IAp7JIxd+q7HnbeKErrvLWBglm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPLs56kN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso5719345e9.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 03:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745489835; x=1746094635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+Imx+wQAU0QKY64/Iw1K/RWq1pYJ8SS5BPHHrm4NL8=;
        b=dPLs56kNFzFtqwTzhQ5o+f6TXMXFNBEloI4mq5ZKZI0I5To4D2sdhXUfcbeeRgIClv
         fpJC4b0qYMvsabyA0xoVLE4s24eOCjfsCnvYUMjNUvABFPfKkizXg8WnzTzRzFyz08yQ
         s8NG4lmNdLWxUmrwYlFUVoB3P40gX+7NNO90al6zGyluLuyD0fzhf9QL9rItHyapQ2Lw
         AT97Iux7cKO7YfLK2Ncmqk5qOqsZiFJvc1r3/KG2BImRiEBO91KO6llASFCRNJtqKZWO
         4fkLjmDwiMDn8DfZzRdasODuFH1S7AiW4ja3SxMGOLLSwKpOnKxl3ilbzBZe/1zS+1jo
         Fw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489835; x=1746094635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+Imx+wQAU0QKY64/Iw1K/RWq1pYJ8SS5BPHHrm4NL8=;
        b=Z+08e/+9sW1VgrqS2RwGlZvbc0OxRV0sg3b7eGXQzeWADmrhCQCFi9QmBtRNvKuS1W
         dCABP/PIv5mdM98SXLoKPm0mvfySQw5o/i3KRABdjw62aIsF9Q5g8HUW3NQa/qznt2n+
         X2/AZ57lt/6XZx0BVTwnmsdoVo1kPharlu8YudhihXfIbXDNtj/Vst/5c9eoLvaHpAm2
         xl88r8TwrC92pWXwJnpLQhnwCPVFs23pCeI2CO2BqB7s4Lx5LhOlGK66vuVgie2ugroH
         3MOYr3Vno3XxxXfUb+yphIhW39DUkQx+Kpj5LWgRqtIoUFB3T+ZEl2LlxOFYIB4wlqK2
         J1kw==
X-Forwarded-Encrypted: i=1; AJvYcCVOiM9jesr4LmNk69G22s59w9twsvn+Vb5rXU2JAdD1KimYJShBPdJYMvypdVnz4rt0ZaJEHodQ89s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiKzpHMSvhk1gxfS8oil6filzJDdQLWdjMdMgrQNDc6KlCs/Tn
	p/WMe6x0+5O3E22W77zqF8qhkCpAR2RYuWgQYQ+i7UBYsjCsPVkFfp7WUDUpBAM=
X-Gm-Gg: ASbGnct8oxbCi5OXbWNyABiMrOCPxLA2JIEz2MQ3waAkrLsXDn98LRPqIegKDZDtctD
	/G+tlVmeUG8Rx4xuHWm9qDI9+GPt4EYnAHIS8PiLDCsx5UgicGisFaqQwE50ozu7PdQCbY7F94n
	hj4K5xyGz4dmu4Mwv4JtPfRDiXTYtkAJMrtJV6rPu1LGABOo4IfTfeXH1MDJNmgYz0ZPbqN8rpn
	x+jnt5KpYzBeZL2/Rwcs8gqAsfDx63QLBKXNAtqn58LbOCXfsQYEVKHKkcE+9Z0V0fFIKHDkyHe
	zl5hDbuQbIbzstLVyXnISB2+FPKt1zxAo9SsgqyYSWKdJeuFuzTmBdNgcXf0S4W1kzn8j/jjh1z
	98mXZWA==
X-Google-Smtp-Source: AGHT+IEC5Ceql13E4xaaL3vBXjhyhbINkr5oD2t6MLRnBCK5ExF8s71Axb37L5Qr5Iw6ung4pwT7lg==
X-Received: by 2002:a05:6000:400f:b0:390:ff25:79c8 with SMTP id ffacd0b85a97d-3a06cf5996amr1872460f8f.20.1745489834980;
        Thu, 24 Apr 2025 03:17:14 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54c246sm1571967f8f.86.2025.04.24.03.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:17:14 -0700 (PDT)
Message-ID: <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
Date: Thu, 24 Apr 2025 11:17:13 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
> On 24/04/2025 11:34, Bryan O'Donoghue wrote:
>> On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>>>> +  vdd-csiphy-0p8-supply:
>>> Same comment as other series on the lists - this is wrong name. There
>>> are no pins named like this and all existing bindings use different name.
>>
>> The existing bindings are unfortunately not granular enough.
>>
>> I'll post s series to capture pin-names per the SoC pinout shortly.
> How are the pins/supplies actually called?
> 
> Best regards,
> Krzysztof

I don't think strictly algning to pin-names is what we want.

Here are the input pins

VDD_A_CSI_0_1_1P2
VDD_A_CSI_2_4_1P2
VDD_A_CSI_0_1_0P9
VDD_A_CSI_2_4_0P9

I think the right way to represent this

yaml:
csiphy0-1p2-supply
csiphy1-1p2-supply
csiphy2-1p2-supply
csiphy3-1p2-supply

dts:

vdd-csiphy0-0p9-supply = <&vreg_l2c_0p8>;
vdd-csiphy1-0p9-supply = <&vreg_l2c_0p8>;

etc

vdda-csiphy0-1p2-supply = <&vreg_l1c_1p2>;

because that captures the fact we could have separate lines for each 
phy, names it generically and then leaves it up to the dts 
implementation to represent what actually happened on the PCB.

That would also work for qcm2290 and sm8650.

https://lore.kernel.org/linux-arm-msm/20250423221954.1926453-2-vladimir.zapolskiy@linaro.org/

So for sm8650 instead of

+  vdda-csi01-0p9-supply:
+
+  vdda-csi24-0p9-supply:
+
+  vdda-csi35-0p9-supply:
+
+  vdda-csi01-1p2-supply:
+
+  vdda-csi24-1p2-supply:
+
+  vdda-csi35-1p2-supply:

you would have

+  vdda-csiphy0-0p9-supply:
+
+  vdda-csiphy1-0p9-supply:

+  vdda-csiphy0-1p2-supply:
+
+  vdda-csiphy1-1p2-supply:

Which would then be consistent across SoCs for as long as 0p9 and 1p2 
are the power-domains used by these PHYs.

---
bod

