Return-Path: <linux-clk+bounces-7723-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA7B8FC571
	for <lists+linux-clk@lfdr.de>; Wed,  5 Jun 2024 10:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60D45B24E17
	for <lists+linux-clk@lfdr.de>; Wed,  5 Jun 2024 08:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1046A18F2FF;
	Wed,  5 Jun 2024 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wxz/znPH"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4E118C356
	for <linux-clk@vger.kernel.org>; Wed,  5 Jun 2024 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575003; cv=none; b=Q036SNmO0gmPDwpcYDj5dn7wnsfSgqmrT13lrB1hk8OMqM9nB8LydsP+tissQMwp7q1dr8mrLjjf5V+jLu4ZgCz8O2TFtOndbFVtfT1TS4F5yVqlXYeVOLc2flw5lQo0giMp/KzkWyM6/BHq8q7Q1sEjecnxLxDeUjrJHCSpcF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575003; c=relaxed/simple;
	bh=V+J+aSx0uqudxl1j+rKhAnrCnr6zYmBJyG/Uhr0zig8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bhBsbOstSyUSiJPUJ5kgPyViH7lLdfUKWHHxm5JrnpBNYnrIObWsvGb3I792RAZq0NrxnI3XYlfgrQUf7o6y3JxKhC3Cq98fTZcP+bQDSgKG2HX2uE1JpAApYKHcQBsj5aBW/R19JjfBhARq5IThcLe9mqKG/kqC2k5Oo0MpYjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wxz/znPH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42148c0cb1aso18148975e9.3
        for <linux-clk@vger.kernel.org>; Wed, 05 Jun 2024 01:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575000; x=1718179800; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CI9Jh7n7nvhvvNWDKnjmv17Ru7dwOeHoVtLMN7I8+Oo=;
        b=Wxz/znPHNl87UwF7tPXhn63iolJ/7vYPDBaakWQcaaOVEUF7JuS47vTeDJtAYQr3nz
         TTxIYEORGWfcG9NPWGQOJOsWh0VZ2TKgT1u7b2kOczfEe5rA7K8xuTYQ+UDTu76bjL68
         emrCzqDSGiY7uO8LhkRY7sO6NUz4CsVwabrFydBdjW0vZ7UsOSGuL7alNl9lywCVTCbg
         oEafbJBAxi1TC5nR+hrd/Kij8y1teu8JetDtoZcQEk1Ai2v8UjTLW+cwYZkV4vVphnLf
         j+JKvexbZy9RrAVHk/7yA4EmCYsItavZ/YsJduyq/B1aKgdrQlR0HNCy533U8wT61TEY
         N3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575000; x=1718179800;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CI9Jh7n7nvhvvNWDKnjmv17Ru7dwOeHoVtLMN7I8+Oo=;
        b=BSrLHKg7LUbNFam6iYLxGiCzFfvcoOBYyu4YLJjLTFnuWeBAhalFBwRxzb7ujKNLXU
         wpTsa7jEdGCOWpOksvgh9/Tlrup2LnrWr2gZX2wbBXLHc9kyYT2mVQCsLDnEjn1vZdch
         PlG5OzRd2tgWBMRAU8aKAgoY9sJcat/kbLFkL8wE9L0VHt7fb3YD3CptCtZe90+8wHVb
         xcxuru7uMLMJcmFkBqP9qmLkUfdNcv54fQGS5sttqbzaR+x77Y7OKUaOTxsUHK5B2I1i
         SeUXQ35Di21ZAmUWTD/5cbDNBdm2YgNiCgajnWGYQJo6unjntj5Kc7nssBoD04zOm933
         3cvA==
X-Forwarded-Encrypted: i=1; AJvYcCVTFD+0jASb5fcba388IepcajDjfEn1iZv0GnI47Cc46HQe/d8xOh7uyKeSkyO4mr2jVoIKFjVOem6tdUC7UZPkTxNmwNoCo/a5
X-Gm-Message-State: AOJu0Yx+dTZt57S0IWmRPseimv8df25T+mzwplvvmJh4RVri87wV5FSD
	mrOzfsOW7+TXuCq0oimhVwWR9KP57l7xhLpRbraoBHzMaFuY7Qw2/Oy/N1JC1Xo=
X-Google-Smtp-Source: AGHT+IGr2uSf0VOxLmSzSagIc6jUkPrH43cyTSHezfDDKxc+I65Dj9YFegRjqgKRVxT237y1Vjn/yw==
X-Received: by 2002:a05:600c:19c9:b0:421:52ce:6878 with SMTP id 5b1f17b1804b1-4215632d091mr13732375e9.29.1717575000415;
        Wed, 05 Jun 2024 01:10:00 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490e5sm11025585e9.34.2024.06.05.01.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:09:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/16] dt-bindings: clock: qcom: reference qcom-gcc.yaml
Date: Wed, 05 Jun 2024 10:09:27 +0200
Message-Id: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADcdYGYC/4WNQQ7CIBBFr9LM2jFAqaauvIfpooWBTqKg0DSah
 ruLvYDL95L//gaZElOGS7NBopUzx1BBHRow8xg8IdvKoITSomsl2gUnDpaDz/gy8YHeGCTVd52
 zJyGEhjp9JnL83rO3ofLMeYnps7+s8mf/BFeJAqf2bHXvSGolr3cOY4rHmDwMpZQvxmoWnbkAA
 AA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3385;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=V+J+aSx0uqudxl1j+rKhAnrCnr6zYmBJyG/Uhr0zig8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmYB057IaWR6MYppdF176okt3i3k8qz2rFqYhnU
 dbhPmj9d8SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmAdOQAKCRDBN2bmhouD
 1+6JD/wLoF8PMRYdGXJxoetguQdaLAB8VEH2ebZam9hPVLhfXDP+ea12mkoAKya7qWgQxV9w7mh
 1b5/PUG3PkG1uxPNkgJ3aHSCKAik2d5FRFMXCJtnaedwRSnE85OnPYNbqpFyZXhoPGSNvoYlBOf
 igM0XdYxnhyFETvX6103y1ynkY5I1tbWJTlexEoW6aqk93Cr+nYhNFgQ0RHf6viZ12AKOJ0842N
 AAw+sVGQyZysnlGMkkS/j8vJTWqsRt+LavXYhZ5kWpVeOsYnxCRsvIulBM9qW6atMq0SQTVWwJa
 2cz45wFdEEP2wx8yjD0Eu1OLwWZ5v3z860ZlNqeEH2IYBj9W082wm+PxHshhrvy7P9GjKDa8VrW
 +AE9MX5HRsPpJ3JIeu6hdIgGO737OnZ88yTRw4jLiqcRlc6gKKrVICV4Z8HU+r19VcGs5F8x/zN
 n0yI9T7QI80pOBp/+ufTnL6JdR6aC017949XB1z3tgCSIJ3vSd/cuLw+rlxLXg2spHlTCa+Gj4Y
 YKjTmowKl/imOCbktP8d6L3/1XlKNHm0qmScwfEug/Kt25EWCTwfzjUnehOQelFc3E8tyDHCnB3
 cSwRbTTprOa7OZWRHWka7t6e1lehH+lzN6sISKPxra9sSgrqO71sOPD706TJs/aK4FjzpqlRaAk
 qlBtbXub0QVH8Og==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Changes in v2:
- Rewrite commit msgs - don't mention there is hardware similarity
  between clock controllers, because that is not certain.
- Link to v1: https://lore.kernel.org/r/20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org

Description:
============
Unify Qualcomm clock controllers by referencing qcom,gcc.yaml where
applicable.  Several existing bindings for these display/GPU/CAM clock
controllers already do it.

No external dependencies, this CAN be applied independently. It is
aligned with Dmitry's approach here:
https://lore.kernel.org/all/20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org/
(but no dependency!)

Best regards,
Krzysztof

---
Krzysztof Kozlowski (16):
      dt-bindings: clock: qcom,sm8450-videocc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,videocc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,dispcc-sc8280xp: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,dispcc-sm6350: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,dispcc-sm8x50: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,gpucc-sdm660: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,gpucc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,msm8998-gpucc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,qcm2290-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sc7180-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sc7280-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sdm845-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm6115-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm8450-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm8550-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm8450-gpucc: reference qcom,gcc.yaml

 .../bindings/clock/qcom,dispcc-sc8280xp.yaml         | 20 ++++----------------
 .../bindings/clock/qcom,dispcc-sm6350.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,dispcc-sm8x50.yaml           | 18 ++----------------
 .../devicetree/bindings/clock/qcom,gpucc-sdm660.yaml | 20 ++++----------------
 .../devicetree/bindings/clock/qcom,gpucc.yaml        | 20 ++++----------------
 .../bindings/clock/qcom,msm8998-gpucc.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,qcm2290-dispcc.yaml          | 20 ++++----------------
 .../bindings/clock/qcom,sc7180-dispcc.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,sc7280-dispcc.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,sdm845-dispcc.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,sm6115-dispcc.yaml           | 20 ++++----------------
 .../bindings/clock/qcom,sm8450-dispcc.yaml           | 20 ++++----------------
 .../devicetree/bindings/clock/qcom,sm8450-gpucc.yaml | 20 ++++----------------
 .../bindings/clock/qcom,sm8450-videocc.yaml          | 20 ++++----------------
 .../bindings/clock/qcom,sm8550-dispcc.yaml           | 20 ++++----------------
 .../devicetree/bindings/clock/qcom,videocc.yaml      | 19 +++----------------
 16 files changed, 61 insertions(+), 256 deletions(-)
---
base-commit: 861a3cb5a2a8480d361fa6708da24747d6fa72fe
change-id: 20240531-dt-bindings-qcom-gcc-e2955fd60004

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


