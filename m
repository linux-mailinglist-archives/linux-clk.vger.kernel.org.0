Return-Path: <linux-clk+bounces-13028-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C30D99812A
	for <lists+linux-clk@lfdr.de>; Thu, 10 Oct 2024 10:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 043151F26C31
	for <lists+linux-clk@lfdr.de>; Thu, 10 Oct 2024 08:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EEC1C32FE;
	Thu, 10 Oct 2024 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cz1W01Zz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6AD1C2435
	for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550509; cv=none; b=AyjnJikt42HYgEIDXrK/tnnP2qlV1KLvaCSbvlTgINzzRTNOWJSEv8Eq9H3Lh1j3NqorhWpqkymFyr8j3rnLYicwqmEm80PVXwF6CajAw3IDMCO3gfH+AYI5dk1OeVNaw9+WDepPoBIJBsLBtVWffdApmjA+FSRvJPAh+LhpRro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550509; c=relaxed/simple;
	bh=DAPSm/hVLz3ijVUhrjOE6QLXIASBKZCEsq0noyvklTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=liD+HzrRtarG1bvFzBg4W1kE6CqLm17VZ2U4S+YM0ycgBwa4nz4ZKT7zaa9wkBEFrF+SmkDynuYgnNJiRNKRcGCtNpb/hT8bstFt6aPPcF93BPsgFCP1K1kW7cMBtu+AYC2SyNJ77TXCTq6qmhsQ5im16nBXYas03O3fCihWk7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cz1W01Zz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43111bdd54cso1109645e9.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550506; x=1729155306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrycbDdKyC3E7TIP9ThkxwNY708wBJiiusjj8WwNBJk=;
        b=cz1W01ZzfUWuR9fsus/Gol3pcabUHqqLqKZLdewIp/fOiKT6j3456+j/Ur23OVkhG1
         +WvDsEtShkkoIor1ycDm7DKKcTas4DvHyVVZ6UTT8Uq19QpPm9jMvqWGY4nwsy3LAKml
         eAorEoPiB7nJfT4pKEGbqISHUhHdsztqbSNjx/kIr5J6ihtyimSjTZqPlCwC5x2cs+I8
         8xqhmuptyyd4pdvR7tzNqptCkGaxA+QMjdB5iaNMlnS+S4Wzo7HXNW9bDXf+LbUY+HAh
         aOLmp1h3wQ19hIL8TGlGzIM9as3jKp5sLyHGc3UTzAs0DUS10/6qOMNbSoUA2Oo9/8Yp
         r0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550506; x=1729155306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrycbDdKyC3E7TIP9ThkxwNY708wBJiiusjj8WwNBJk=;
        b=R7CfX079EDLmFWuvcsQFsc7zS8EfnQZPO+nNG2nmnuSVRdIL/Fc8xXL0sGIJjzgyXN
         xLMKX40QxmDr1MaKJWBO5f6xOJ8oKwJtZaa+K6KvoOLpFdNpNOxGuscWXJSJhRLhBtm8
         sRDEmLVAzVaWIsryphL9e8QlxESuXwIscnQHeDYQ7XRW4z0JU2Ueni1icfp2GiAqFMOs
         ZDg4Cw5Qn9wYJZlfvrcqD4SyWSa+C88bD5qDuMX2MMP6Fs7ATp19lTHUn9M1sgTQUFyB
         MEMmueC3q6ScyD0rcjs1vK0eVp89W7eTJF1mmldaDbtOeRcQZDaGq3dHuTYqI+5oWB/m
         NwDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAhYzA13IOlSn5dnXakbL6nb7Gmvsc+mXk1iJtqnI4g3vmetODHNV4C7eFa0XgZSafqsT0NieicDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC5/WGgk+tIb3fsRDW/3QLvEok4I7sS1rhzkVHsr1AIlT7sn3s
	pRVccLIjFvy5nPuVTtVzJ0CvEzebcBQIKmF/U2bqN7gGYrW9f6b+D0gAMmxessQ=
X-Google-Smtp-Source: AGHT+IE+XisM25TXSMRumwkRzfnx7ug3YKF4W65ELHrKE0cNsyxjqHzTzMSSWw8nejs5fu7CQWuVYA==
X-Received: by 2002:a5d:47a4:0:b0:37d:4ca3:310f with SMTP id ffacd0b85a97d-37d4ca3320amr425550f8f.12.1728550506310;
        Thu, 10 Oct 2024 01:55:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bcf5bsm902012f8f.32.2024.10.10.01.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:55:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 3/3] arm64: dts: exynosautov920: add peric1, misc and hsi0/1 clock DT nodes
Date: Thu, 10 Oct 2024 10:54:57 +0200
Message-ID: <172855049021.142350.11192744984413757568.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009042110.2379903-4-sunyeal.hong@samsung.com>
References: <20241009042110.2379903-1-sunyeal.hong@samsung.com> <CGME20241009042117epcas2p2335311cae816f9c92b15fcd28b56e413@epcas2p2.samsung.com> <20241009042110.2379903-4-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Oct 2024 13:21:10 +0900, Sunyeal Hong wrote:
> Add cmu_peric1 for USI, I2C and I3C clocks respectively.
> Add cmu_misc for MISC, GIC and OTP clocks respectively.
> Add cmu_hsi0 for PCIE clocks respectively.
> Add cmu_hsi1 for USB and MMC clocks respectively.
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add peric1, misc and hsi0/1 clock DT nodes
      https://git.kernel.org/krzk/linux/c/ef1c2a54cbc7d9446659115c3a61e03f97ba4a57

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

