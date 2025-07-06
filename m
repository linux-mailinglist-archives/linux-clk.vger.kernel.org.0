Return-Path: <linux-clk+bounces-23874-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AB3AF01C3
	for <lists+linux-clk@lfdr.de>; Tue,  1 Jul 2025 19:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D9CD5207A0
	for <lists+linux-clk@lfdr.de>; Tue,  1 Jul 2025 17:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAD727FB0E;
	Tue,  1 Jul 2025 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZ/zFZrW"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813527703E
	for <linux-clk@vger.kernel.org>; Tue,  1 Jul 2025 17:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390938; cv=none; b=a1xVTaCoINbbEi4Fx6wHA3TpqWosSvrBCNYWLDUq+cKo6BjmBN3T1uiZy9svCH+0Id6CC8VR2U3XRAD3846J72bIzaDteeNv3XRA+H94Ek9Li/+M2JR5k/0vnutSPQsKgP4FYm5cIoN3CUwpAqxsabiOqq5ODkjx+4WuR6bW5dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390938; c=relaxed/simple;
	bh=3IyHkvcQPjT+L7Hw7Xdc4sAUW0eW1K5VesBjPPWvXGA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t/hox3PuI5o9OWv4jvL659Wb3eaI7cVRfnGQ0uZ3jTY2Am759JNv2mrga2X7CC/FNgbHn4+l1GsOlgmmCoy3grHC4syu5QVrCQdBj3RixW1J0yyNdEoCtt49KsE7UJnNi4V4NY0ouWZDQugUrW+0Isl+IB4YxCVG7SBL5vmTBj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZ/zFZrW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45363645a8eso41574515e9.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 10:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751390934; x=1751995734; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9y0xKUQz6sJ9RW7ntZ21D6nwLji1yQQHh6OPtk5BYu0=;
        b=VZ/zFZrW7ahTV/sbU0j8irOlop2ubwfjGC0a0MWNDNeEw/A1XmDpJL3TNxuYEPGB9t
         YvIhrnmx6hiC7PvEhUs47Bp2CjsAzVZlISmeQJAEpbrZSY4XYnayHFzmtxDtuINj7l7x
         +S3yXYZpWrukhmqdZneLE0SPSd/cgHsmx6g3gE+wiHlgd1HccJ2e1a4fMUdzLY4J7TRn
         ojVpsYJhDkUx69cH0SWPxxM8ZPleJ7wZ/mSGSu5GmXXl7TmiqLSgUhS355mNZPH9/3gK
         fcGZUSGGYmhUVG9NyU6pWBWOWGE5yzc9Qmr6Iks4D9lk3mub8/ZEM1s00qmjBqz4EYtK
         ePqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390934; x=1751995734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y0xKUQz6sJ9RW7ntZ21D6nwLji1yQQHh6OPtk5BYu0=;
        b=dUUrSrODPVNzB5LnNNe3tXtJM8ywVv49j+AoLGW+W7pQugoKd+xTKpyUPRhSAD+cqz
         YQzhEf5pDBjHYdYGst/u2nfT4nHxqZwYe12ftICJKX1UWxcPlcL2IRtjcsmnMKGstQVY
         Bbf9sILLtfhD9bBOd49kCMiLO/3+/xeGjJkyha65YR1sglaMASwcjF4Y+xnx6wtld9jO
         i80xoi1L3LF2uEzNX9aVE+3p50HjALVTBgSPiKZpwfu8yYIB71wQlRVl7rykEekuymQ/
         u3vMwupRZEGZ5QyTI9iSAK9t8QQ++E9vs/1NbRp9wvK+7FKST4focaPohMjFfNVj6nTN
         JUVA==
X-Forwarded-Encrypted: i=1; AJvYcCW56U7O4MXDUz3vf7xzCUOjDX6nnPE7SMp+qeIgjnqWAVDoZ9JbnbNixtLaN8JJx8fU9cfeeIhM4UY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZnMGKmL4SiUaDulTJuy+yi1/QBd2pV9fiFhCaqTeAGM+P/UDh
	sdGEpfZqzuzx975DPxRlMSV64Q4F1tpYRJLzZzblfNlBkyi0gkz4HHsyY2Yk7fl8UM4=
X-Gm-Gg: ASbGncsWdUOeECC3kcv6LAMlbn23hvvZfw2T7rxH3aBN3+w4aH2f6ouUz7zHnkUplqK
	TXnZkr8q678rlR6qayCG/Ru+3CoYRE92MJw/I8Ulqc9gXh8IHBCPqXwaXj/WcYHhivdnYilrmoB
	fYiT220og7XzC7yUmNsU4UrvT5nCKWkVQrDp2eyZ/PinndjG4IPG+imzmjAGrJ7fQe80lJqr7zO
	RxH35MnOKQlpNlnyKF6lQ22azfKgTlfq3S0DzJhUKpQYyLt5kTsCE2ydyvTfDXlsnCizcJL5qnH
	bdL8lbWkLKCyA32R9o8zF+4tRDSwnA1B0aeaXCcsRPPz4Ja8OfvXbYEl9cxQfVp3T2bnRSJvhAX
	PPw==
X-Google-Smtp-Source: AGHT+IEVPWfLWerA9EVdvnKKYjWG1lZ011oDFmffIcgOCtKr7rOwtYs8Wzefb09xq5LURBKmZ+ztig==
X-Received: by 2002:a05:600c:c169:b0:453:9bf:6f79 with SMTP id 5b1f17b1804b1-4538ee624cdmr155141935e9.26.1751390933910;
        Tue, 01 Jul 2025 10:28:53 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:1425:eda1:87ab:f850])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm198716175e9.11.2025.07.01.10.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:28:53 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/6] clk: qcom: Add video clock controller and resets for
 X1E80100
Date: Tue, 01 Jul 2025 19:28:32 +0200
Message-Id: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMAaZGgC/x3MQQqAIBBA0avIrBMcy4SuEi1Cx5qNhkII4t2Tl
 m/xf4NCmanAJhpkerlwigM4CXD3GS+S7IdBK22UVSgrknzZU3JOogoYtDZ2WWcYxZMpcP1v+9H
 7BzuhM6VdAAAA
X-Change-ID: 20250701-x1e-videocc-10f1f2257463
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

In preparation of adding iris (video acceleration) for Qualcomm X1E80100,
enable support for the video clock controller and additional needed reset
controls. Since iris in X1E is largely identical to SM8550, reuse the
existing videocc-sm8550 driver with slightly adjusted PLL frequencies and
adapt the reset definitions from the SM8550 GCC driver.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (6):
      dt-bindings: clock: qcom,sm8450-videocc: Document X1E80100 compatible
      clk: qcom: videocc-sm8550: Allow building without SM8550/SM8560 GCC
      clk: qcom: videocc-sm8550: Add separate frequency tables for X1E80100
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing video resets
      clk: qcom: gcc-x1e80100: Add missing video resets
      arm64: dts: qcom: x1e80100: Add videocc

 .../bindings/clock/qcom,sm8450-videocc.yaml        |  1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 15 +++++++++++
 drivers/clk/qcom/Kconfig                           |  3 +--
 drivers/clk/qcom/gcc-x1e80100.c                    |  2 ++
 drivers/clk/qcom/videocc-sm8550.c                  | 29 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |  2 ++
 6 files changed, 50 insertions(+), 2 deletions(-)
---
base-commit: 0672fe83ed07387afb88653ab3b5dae4c84cf3ce
change-id: 20250701-x1e-videocc-10f1f2257463

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


