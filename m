Return-Path: <linux-clk+bounces-2063-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF975822EA6
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jan 2024 14:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9C701C218B6
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jan 2024 13:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9E61C6AE;
	Wed,  3 Jan 2024 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGcMzbmU"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31391C2BD
	for <linux-clk@vger.kernel.org>; Wed,  3 Jan 2024 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so835044466b.2
        for <linux-clk@vger.kernel.org>; Wed, 03 Jan 2024 05:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704289033; x=1704893833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ls2aUMbVxdc/7lozE+p30ZeM7lcweE8oneLXZx5wYg=;
        b=QGcMzbmUacsSd58oRUd4e21k/4GGq4MGKovvAHEw+pT6UmmgXuzd9Qpr2A74YoCfxE
         MB4pEQY22AYJzi0xHPqlgmJrZvBMG0d97fhlgjnOD0dLK5fVYNlZ3gjvQClKbslmJBB/
         QlIuogEl0vzAgMXW9sY7mGmXK0rzi0xpcM+0De4M0JbIMQ3jHCHzIRcVZXhP1sIarbo4
         RArVFBEQOPfbAZ8QbjD9exYj62Off0dIWbvIXXYexa+IIrIIi2MPHVGyXgrCI96H0iG8
         neQKKzsBbhPM1SpLGTKxrd92Xon0HUdfqZ+J2gKVeF67XObkTJHNDRgvl29cXNtY+Tuq
         pbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704289033; x=1704893833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ls2aUMbVxdc/7lozE+p30ZeM7lcweE8oneLXZx5wYg=;
        b=LG4lEm0K977eB+iLjMOfquKZnuvOHvA/nYcSW4HLOxFZ6E7jIkPoZ2D5fHisCS1RgA
         eaZIPUI4AV0AZIYQCaVYY+j3R/6KxA1F5m4XzjBvgfg5XStrjHx9yT1oJ9RD4cE24cso
         iZDzHRocczM/LBziXALit6U1wPepU7MS6XsHgJLqL/aMjiNPvBUMxsiJfCizUOZjQEPH
         PYYYjy0rPtGSj9PgsvrUFBSgyfxNvZutEg+AG8Dhmqbq8yxhn/SnELGunONkMkCeUMry
         ZyJ0tom5/E1ZpTeUX9jiJo8j3gk3Ud5mre7pu8A3RXXlGm29YW8QebthG9ONxe84FjKL
         D5ng==
X-Gm-Message-State: AOJu0YzYzmvUBlMBxbUz2EDYTQvCqhKlJBdk1Hi5aySi2OpssfX7K5uM
	xFQJLsG3nn3EDLDAs5270tNlJJeH3MlSZA==
X-Google-Smtp-Source: AGHT+IGpnAm1YkMHGNwPzJ3DRXklifvsksvW4hhRlQoW6RG52YHgNlPC2VFhLZd8F74ypE9UZEQs7Q==
X-Received: by 2002:a17:906:73d9:b0:a28:6e42:6798 with SMTP id n25-20020a17090673d900b00a286e426798mr597344ejl.61.1704289033363;
        Wed, 03 Jan 2024 05:37:13 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id cl2-20020a170906c4c200b00a275637e699sm6474351ejb.166.2024.01.03.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:37:13 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 03 Jan 2024 14:36:07 +0100
Subject: [PATCH v5 09/12] arm64: dts: qcom: sm6375: Add VDD_CX to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v5-9-99942e6bf1ba@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v5-0-99942e6bf1ba@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v5-0-99942e6bf1ba@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704289018; l=718;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Gc/yH23ZENvzGFFViZ7/qVCV3FeiRMp+LehbPO3k6Xw=;
 b=Qe9/JEGcMm7CuZ8EE8ZjuJT/aV+Qlb+RHQliiaxESf2QmZB6YF37XfLxBq9aEGe+/FuC7R6I8
 iJrXxfeKBTCA5pb2Gm8v0iEeVa9zxxRgRuxcAGZKOoPdvEBQQsHgnuy
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GCC block is mainly powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 7ac8bf26dda3..f578d110f36b 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -954,6 +954,7 @@ gcc: clock-controller@1400000 {
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
 				 <&sleep_clk>;
+			power-domains = <&rpmpd SM6375_VDDCX>;
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.43.0


