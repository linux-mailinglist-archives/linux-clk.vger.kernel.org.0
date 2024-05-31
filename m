Return-Path: <linux-clk+bounces-7576-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F628D63A3
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 15:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2AB528E178
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 13:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2047517C7D4;
	Fri, 31 May 2024 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B937YYo9"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7E176AD6
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163576; cv=none; b=FRkLxMLvuLwSu/osQuskjXKWU6Lly8ZDZZ8Zkw7MvnHsquVelGtx41qa3nFKjSPxXVoX97+nMOQLum0+l4x+bG7kkxQGya6kTk4AfGsBERWAm79ylXMCmYmCp2O2Nn2aDeN9wsTdWMn4uc0F9pqYFGYagnnZMw31FA8zS/Is0Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163576; c=relaxed/simple;
	bh=bKL3yLbx6CN3YGxvLG+lPb0yuaG5yV6wutVHiqw4uS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUBTj0c2kYaE0sVefK59Nd9MFXlcZYmg7sSJkaI1w5AlpQhl2qq+/T14gBE+nmUABASYgC60FAafGcy19+ZeBhdX6bYX4x820B4N0THSeNSS7B2wKb3dVNeg/dVMbzZKDDWnYH9YxrodOSBnjzngrmjKZGv/mUTu6XunuqhMtnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B937YYo9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4202c1d19d5so19499995e9.2
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163573; x=1717768373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIggALpf9dLz2cqwINxnQ7JP4h9D1sdReZbSpLb/ibg=;
        b=B937YYo9i1BBsLqkiJCLu5uoCjyxmShAyVGcsDuBojZEL0wipo20PodBCR1vhuaFAZ
         KkcjsuKKfhemdNJ58yRkDokDxdgALkKyCYlJFHX2QrrakEazM/A+HrRvUa40WXsJRRVN
         2hP8n1DjD48m9b73W+v1NSGPeUIFBOEiCy4l6+81acDzsi7Y7oA2LgsSHlVRc7k3qZZK
         AHdiKL9/WZKACtNnL2qDvE3G+ViVKxKmpmeva4kM/DgRGk6zWdeBta6nsHamJG26V9Xi
         gvIq8jZp7FTFiELDsjnUcbBTkw75wKDAvJuPfOxLBglOsF9H3asEmKyycBtOqGts1Jkm
         FN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163573; x=1717768373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIggALpf9dLz2cqwINxnQ7JP4h9D1sdReZbSpLb/ibg=;
        b=FQPn0tYNZT3PRwq1OclNB35sqbtsRiOtXJHJrIajGuMDaLvfSTjz+FaGz2mB3SG+/e
         MiJMbtbuGGFYXiIwqZIBqfrFflddjpWUPZtBxyq1yK4dYg7lURcoukPTjzyW8VufsZJb
         HXt3vnBbbK3R7pfiF1ULNl5y33foWFpfXfrxZ79p6+iNm2oW2FD/KfiKmw63PGZGTg0I
         rDl1XqoCbBx0lBQaZjwDTY4xQa1lkLqZy181+lKZKI0Gk6s8FF1XDMqMm7uuZmtROsuQ
         ycdts5rdkuNMLrdK1VS4Kcq616kwLaCkGenNq0qEpubdIbqVZJF1EdQr4Ohtfa5p0g0o
         nHAw==
X-Forwarded-Encrypted: i=1; AJvYcCWWc501X8Tuvct+c8cAoasCySP/hJb0tGjwY/AZ3RB5ijd+jd6RalJy2DtzioJjAnbvU3vmw2rpsM2JyWaevhe6PCHCjfwNnw+x
X-Gm-Message-State: AOJu0YxOhb9wNwOr8eHh/xjjT/uiI2sLNfR+EUXdl9gOlrhDTddr7icl
	JAZoWXtMZSTFea+E521o+UNHUjsfKJRWe5IWPNgys/MPgzKQqYnTRooObosRzog=
X-Google-Smtp-Source: AGHT+IHGtsSoxweOp9jwPnQb4Utnr7hRZcQqkF6t4oFoHL01Y4Y1FjWqSv7NUf4HvzRIUnhyB2Q7ng==
X-Received: by 2002:a05:600c:4f82:b0:41a:821b:37f7 with SMTP id 5b1f17b1804b1-4212e0a52f5mr15721145e9.27.1717163572897;
        Fri, 31 May 2024 06:52:52 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:24 +0200
Subject: [PATCH 06/16] dt-bindings: clock: qcom,gpucc-sdm660: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-6-b37d49fe1421@linaro.org>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
In-Reply-To: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bKL3yLbx6CN3YGxvLG+lPb0yuaG5yV6wutVHiqw4uS8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYbaw8SK12r8CbGh98O5JS+CHQRZsuGqXK9+
 6mGmDkssuqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWGwAKCRDBN2bmhouD
 196oD/9pADUg5MpczssSGklLzL0R8muAgmgijp0U1Kz8W0BsMZNIrx4xOHZEvMmvzRAEb4NHH+3
 c7fBqg2HNWyCiI/kXAuBsO2wod5CBQVvicCcQvIipGVx6h+oZdzUEXp4V7y9sK72cHGBTaesHzb
 WLD7Yo2CmkJZTKlqPy+A+MO6ZRJvjLJ6N1vQj+1vXtH53S00pwkBEAfNKVIbQ/8vTKGIX1yZmiO
 0T6UFXfF6MPKKGwemWFimCEq1130SmhJ9PAZi5GisMLDa6ppVQ5DAb8PgJr9+uUblz8LWoTSyEK
 eHYZR//SOAHjlXX+lhSiCSfTtzM6BcIgEieWYhoLFkqH5+9OoWlpLKMxZkXQqa9FGMCaEnpvnZh
 JAI/jkOuZ6SLJpVHZ4xecXM7MG7OLEsdRCTZuT72gAUyjwJExOGxQP2atzMCNQrayR3ai8e02hi
 WhfVU2ns22Ax+x9gHNkgZlaSzxPTnXTkjKtPXjHYts176B+EqOO4BH1ERLNnexFCn/I+kCaCC5r
 CHkvCrvNclpeotUsVeEHm+/Lbhpg29dOABKuosx2ktozEtOoR/Qd7KYHxP09HWEaLN/hG2Vg8WQ
 ZuTi5CzjOxE3tzFHU6n5BlgmquuY07P8/1HaWJsSR4QaDNAamh0VEnVu7WLXBsFAhoB1fWMaLdH
 /w7983gF4JCstwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the SDM660 GPU clock controller is
also some variant of standard Qualcomm GCC, so reference common
qcom,gcc.yaml schema to simplify the binding and unify it with others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gpucc-sdm660.yaml | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc-sdm660.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc-sdm660.yaml
index 0518ea963cdd..79bb90dbe4c1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc-sdm660.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc-sdm660.yaml
@@ -33,28 +33,16 @@ properties:
       - const: gcc_gpu_gpll0_clk
       - const: gcc_gpu_gpll0_div_clk
 
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


