Return-Path: <linux-clk+bounces-14839-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F16639D2678
	for <lists+linux-clk@lfdr.de>; Tue, 19 Nov 2024 14:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3253281A90
	for <lists+linux-clk@lfdr.de>; Tue, 19 Nov 2024 13:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6121CCEDE;
	Tue, 19 Nov 2024 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uRW/wFl/"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02F61CCB49
	for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732021837; cv=none; b=NGUCTxLk9MO5EzRY6zVNJKIfqLMQbR23xTUM7Rm4NC49HsUNbErApN/weCpFkNj1NXxO6dDV/aLDxKjC1Jm3o7wzEaTYuspbHkZJYHAZzURTFDQFcUg4nx1MKlM2RTsEEjDIKJTPOUMoZro8aMsnYj0ngi3zZocDKbHH5V3is2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732021837; c=relaxed/simple;
	bh=4fXNyWptEUJ9NqiDYY4v5f2MA6FE8JIpt+fHVIuwt+U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kKKcGBke2NTdMPWnUTF6q+ujRh7A31hqGqaV8Pvbxy/68wHlyyGK6iDdtxhOX6mb8pSgmEs1Hc0QOWigXqCNDDHyvEmgF53OXKhyyzK9kpZ1fyK2MamxXDHtkz1zXkSRcU8MCVmyaP8XtZUjnzha9y2SJQuqQX7hy/Ey2QZ7qhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uRW/wFl/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so38332955e9.2
        for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 05:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732021833; x=1732626633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCd1XDFaDcI0eu/5aCsZjulpUPFQcIcFClGyDjhAXE4=;
        b=uRW/wFl/vKGPh88hCVHGj8Kc5Lbj/5byEinOJs5rYAPJNT4tezCpD+SuiMW+GdSRDJ
         TJw5+bMxIHSM6m0J8wQrE6obeYYTwNtaiLnnW5xpN4JdzDq+IZGLjbnrRERy7J+cGNtw
         AZJ8WNOVgC20p9u/qqqX5jB1RJF9smcyhqkR+NV/Sqxq4uQVz3wJQs3YyXzFzZicrtwU
         DhSnDzftLph7Pg7jkTGQY3MyspN1thpcBMSZbtg+oBGe+lCFyUDAcqlrfE+8X2gLwHC3
         3lNbxn6gJ4zkneyTArda2MGHlRa44tqy6y5x1rTa4UoIsJd/rynvldHMtxjp4zoZwgn6
         NrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732021833; x=1732626633;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCd1XDFaDcI0eu/5aCsZjulpUPFQcIcFClGyDjhAXE4=;
        b=qdZMET2zd+SpYDNeNHeuBKGQ4ZkKCiLyfOSwLOJ0wQpXgXfYvvi07lJ1djoxs0LGvI
         J8FhY0YzOph6didYjSX/piB7G/6rUNLHSixxyFR6k+fLy/Juct4ZuNsqEyleZkL7K2TE
         iPRxw/hTLOOUfEfzysLhnkdTCj/+rg41XUuZ1+bKndKMUpGpzr37QC30IgaU+19mYitG
         tzmOshvboW5WpDR108iSMC83prJX2KvDtBVXVWqMtcmh3MI8lEJxna19luXiuI4bQRty
         ILm4Sm0/FOQ5/4Et0kCDtIssQRkwSOBAEtTEad43BIn0QSFgQ8JVoHdTlGmzX2foNxPX
         w0NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVflgFbGduAH0ekrQOVPWjhEaIJoDDX45bujF3rk0+MRgEsUpiENr4YGJAClyyQgg3p6YZ4KLxowXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoodKjxCJpFBUuVWvgWqIIr7lBaEfZBp1G0v8LmCkoWMRXUMvI
	LmgrXWtaQq8d5CrIO11vdvHzKoj8Sj3IlYddPjMd8EDIeuhuFYIRblhUvwMJy0U=
X-Google-Smtp-Source: AGHT+IGusP/UzmZ0+YghK5T/t6qFJwR3QEG3Zd6a+CKh0Jg8Puhh2L5Y6iTO7QAmcU06sOzzeyBDEw==
X-Received: by 2002:a05:600c:3584:b0:430:5887:c238 with SMTP id 5b1f17b1804b1-432df725532mr135846905e9.11.1732021833272;
        Tue, 19 Nov 2024 05:10:33 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab76dafsm192016185e9.10.2024.11.19.05.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 05:10:32 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/6] Add dt-bindings and dtsi changes for CAMSS on x1e80100
 silicon
Date: Tue, 19 Nov 2024 13:10:29 +0000
Message-Id: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEWOPGcC/x3NQQrCMBBG4auUWftDJg1t9CrSRWxGHdAomSqB0
 rtbXH6b91YyqSpGp26lKl81fZUdfOhovqdyE2jeTd75wMxHXAIeWj4NRdoCH8AMjsiLKRpLdOw
 c5vQ0Q/Rp6Md+yG70tAffVa7a/rPztG0/dNJJzHwAAAA=
X-Change-ID: 20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-82a63736d072
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

This series adds dt-bindings and dtsi for CAMSS on x1e80100.

The primary difference between x1e80100 and other platforms is a new VFE
and CSID pair at version 680.

Some minor driver churn will be required to support outside of the new VFE
and CSID blocks but nothing too major.

The CAMCC in this silicon requires two, not one power-domain requiring
either this fix I've proposed here or something similar:

https://lore.kernel.org/linux-arm-msm/bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org/T/#t

That doesn't gate adoption of the binding description though.

A working tree in progress can be found here:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.12-rc7+camss?ref_type=heads

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (6):
      dt-bindings: i2c: qcom-cci: Document x1e80100 compatible
      dt-bindings: media: Add qcom,x1e80100-camss binding
      dt-bindings: clock: qcom: Add second power-domain to CAMCC
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   5 +-
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,x1e80100-camss.yaml        | 354 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 359 +++++++++++++++++++++
 4 files changed, 718 insertions(+), 2 deletions(-)
---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-82a63736d072

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


