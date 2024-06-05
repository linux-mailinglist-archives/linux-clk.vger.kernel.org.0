Return-Path: <linux-clk+bounces-7735-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1864B8FC5A4
	for <lists+linux-clk@lfdr.de>; Wed,  5 Jun 2024 10:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B65322813ED
	for <lists+linux-clk@lfdr.de>; Wed,  5 Jun 2024 08:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C720194A65;
	Wed,  5 Jun 2024 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sAlhY4Qi"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23706194157
	for <linux-clk@vger.kernel.org>; Wed,  5 Jun 2024 08:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575023; cv=none; b=QpfZLQjSzVERFPBRP+9Sd4rsyiOapnqcl7HqHmZLPHSkNQse5FFeV4LOHuNbtLa3E5hsaCGtIDRddi1xOjAmybubMwKUW34X6khSFO0bf7NqICDUXGZIjKjteOEmCcIYLHT/0i7nimROvgRTtdXQo9QXzQ/YZAphJr8T2x8kbbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575023; c=relaxed/simple;
	bh=0peE0wb7TCWC3rzL8EkK3WEd1Hg2G3xVYxpRqa5gqbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WrNHVvAQptMwBgjbqpE4m0yKgbjhLTesGGXSNc62/qghj+Qmx43u2pr+sv+eMVbLg3rekXGhwM7JwWLDBfKB8LIQ1HkUkeAjUX42YmPAPbXU0oMMW2KA2cZ8NU9+4jHBiIC6dRh8h3ojbMGRuv5tIz3XCuX6eilLojFH9J2PZwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sAlhY4Qi; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eacd7e7ad7so530051fa.3
        for <linux-clk@vger.kernel.org>; Wed, 05 Jun 2024 01:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575019; x=1718179819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIO8/X2D7wRtcL4aRUQTN5dpPQQIZBrXstOQp+wblcA=;
        b=sAlhY4Qi02CPiExqi8uU8ZkjNYgqzDFwEFT24UJEfRcyIwE8PzZuF2+M5GqqsC4k9j
         B5jBxBsFfEm4ml46xkKyWi+2JbeRdPhbbDD+mETjwmBQqzuuHVdCVa8osKqxnclPWJwG
         sFCHMHIz4JqAiNwz082GQ0xa1ugSTMxCeimLlwoNfjJfhPvGOLimGsBKjuXNaokGSJ4S
         yIZCsUJop5Q4GTAGfl1S4hDlB3xpq9EkKkCgkuRykz4LBEqBm/9mGW1S0C7xuEPf0Rpt
         asSWHurFir2MA73VQNevG2fC/s52mbh0Ot/fXwni9L+xjJdnpjj98Uyu7RGMJISwpaOE
         FfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575019; x=1718179819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIO8/X2D7wRtcL4aRUQTN5dpPQQIZBrXstOQp+wblcA=;
        b=rO0r5hobem8ETh8n7Hr54VCVrkYlHnorALrMZvI/mIlLzKB+FEbFl7eoSdrqRwVJuz
         ihRx5sWgoZWB7UFi2SpLf2eFk6OTa5Pr6U9uflDDBdx8Qt4iSiDzGEZjhIJlxHV+Jt42
         OB2VcxhaoWXoVBE1Bna2+i2WLeJIBTgOuqkXjm/Pk5FIr1egcR7vcl7/XXEv8Mskw4jL
         d4+9IQbAIMtM3ubDrIS17HnF2HbkPFMPtERwTs+QeLKa7IdtPQxwpoq1LDFcWQFoNV2j
         lH9WV1RAGtF9GroqAlAkmQVg3XWENRZ/1+VGQ6PXqyfRGzuNiLxtKmI6HuNy6LUsOPmg
         gdGA==
X-Forwarded-Encrypted: i=1; AJvYcCXTIwW1st6U969t+K82X7obJauyK1/gv6Y9vTDdrUiJgEu13P2a4lLvUGtezvZwvd/o+L9/VF80rmDJb+AhxTttlMtsYE2USdEQ
X-Gm-Message-State: AOJu0Yz/5JWKKpoC/cVoUOQyaTLrLNxyFH/CxjTAL3bYftZGOTzhnKGb
	tldg215yFeKm7LLW6gOvwBNrKfMkmJ3ST7yIeigy9oMgI69t/qZ+LrpuWBcw7Tc=
X-Google-Smtp-Source: AGHT+IEPFM6pFo8BxeSnjoaRA55zyXrbaRN8MY5QOPnt7tidlvLOb2aDbzqZajqy4vvCsxK/UUK1Hg==
X-Received: by 2002:a05:651c:3c2:b0:2e9:8c28:3358 with SMTP id 38308e7fff4ca-2eac79f18bcmr8242801fa.20.1717575019366;
        Wed, 05 Jun 2024 01:10:19 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490e5sm11025585e9.34.2024.06.05.01.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:10:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Jun 2024 10:09:39 +0200
Subject: [PATCH v2 12/16] dt-bindings: clock: qcom,sdm845-dispcc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dt-bindings-qcom-gcc-v2-12-f947b24f1283@linaro.org>
References: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
In-Reply-To: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0peE0wb7TCWC3rzL8EkK3WEd1Hg2G3xVYxpRqa5gqbk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmYB1SBvXAhh/DCYk7nAqm5R8LdVU4e7P7AkM1u
 niOdQzvyjKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmAdUgAKCRDBN2bmhouD
 13mbD/9rUnXgL9wtWcO8qXiiFgnIURu09+f4ND3bn1LQtHLRbOmnFXOzkEU65B9jwZZLjGnlbjr
 yAKU69k3X1iN9IYSvcORV56KFCSn87Nov/MviuxjgMdn0WWJDblh18uhySBmnwDuQ/EsqTOPpDW
 8ZJ1Ufb0C5NFfJTfZGXoexdyFlI1rQNPi/TTa1HCo+ca41YOsULdd6fny/abtMCgBs0AiQvWeGW
 91gRj/FYivvUgglQ/Pj6lIG7ytXcf47/gvG4kfa2j04XcFB3XUXnotA+f6zUCwTe0ZWXAGMbzGs
 mIkZLTypvrs98pqO0QVLkKR+5E1UKKBdKSrR47ycnLkhurrn+76CFQVEW26DS2EvWM/4Xipe99N
 KMpsgchXpr7kl5/2jOd7RGKUzgGVYdwfndXBiOCnZO+I4ChKo/0OUotb/Ik8E8ffH4lr5bGcwUQ
 O/MhdwS8EA1+Vkzfzvx2T9/ZbyublxLllxehVYHXGxa3coxHqBJAzPwVTCErBYTTJz22m4rUSrw
 q3Fufp/Rza7gI8OoRGNUmw0XLHtTG9w4ZO89DiP8I+jqm4aLJYgz67DjzpOKsnuIFpWO8SvQdqU
 8tzPkPSelUZqMCKZ8ilHotG7v0FmQAG+TwD1L42DDxoTy0W8LuVzQxebiIWSmmHSiwKkjxb3PT/
 /M7S8EXHPEHxqvw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sdm845-dispcc.yaml           | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
index 719844d7ea11..220f4004f7fd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
@@ -46,28 +46,16 @@ properties:
       - const: dp_link_clk_divsel_ten
       - const: dp_vco_divided_clk_src_mux
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


