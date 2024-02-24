Return-Path: <linux-clk+bounces-4039-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F858623B9
	for <lists+linux-clk@lfdr.de>; Sat, 24 Feb 2024 10:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BB1D1C2191F
	for <lists+linux-clk@lfdr.de>; Sat, 24 Feb 2024 09:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D262D18622;
	Sat, 24 Feb 2024 09:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oD5+EDKs"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F631759E
	for <linux-clk@vger.kernel.org>; Sat, 24 Feb 2024 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708765963; cv=none; b=I8zwhgAMaZm9VCb3Mu0hBRQAVSrpU0m8H6dmDuwozYH9xgUKI988Dued0weRqMRTpxakSGr8qGXkXXedc0/GWq4/sy4ya8ned95vwoYjghUHRZAzFep2W+Ypwx8yl8Nb696/RG1BxGD3E3icpPbDVmJykYdu+tTd7fELWzDiKt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708765963; c=relaxed/simple;
	bh=QJHaYzPY+m0OHtHiflvDg030t6MnJOuacu/PCuwm03k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ia78yjOfPMPfauAJHgf8k6zV6smjxoyRLwPjrMHIRYr54ad0bwv1PhP0aubrdV6i7m4v0Dkr+zaXCDPBxF9D0ZFN/EOlQVlgXlldVUQ26tWpIX1CQ4ahgU55YMyOOdP75WfxpYslobJl/KRXCrRrcGBTad4SI4ghLUFhFfLZz3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oD5+EDKs; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so2013551a12.1
        for <linux-clk@vger.kernel.org>; Sat, 24 Feb 2024 01:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708765960; x=1709370760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSJ+PeO4x72bs3AUvmTEqtOywxqrxagbi+uMUHWuQSQ=;
        b=oD5+EDKsCqSB++cRrpFfBwCb/J82G2d3Svs5NOnwqgpBw2c4bdZZLqjT+s4MSzUB94
         rFNbBcYCdI99RLoP7k27BF0R05ZHlADbtTZTcIjdSr5oAEzvDQX2BAvObAaSA+yLXf5d
         cKxaMlELTaZuyypcleWFJ/iVp2RvfvzRjmHFJU23hbHZiof5ICfJJ9itaBgfxUOdXSMm
         Jn2nmIGfWWn2nj1bmcgeELrJv9/ap7CMkqq7cFm4tLznsIUU0rmmMRL0t7iYHFMyQ7ri
         UMXDgVW4nyilih9oGpZ6z+0PpTPj7cImysWeOavYYrDtyhAmt1lRno24aSU/pvWpF3+e
         wYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708765960; x=1709370760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSJ+PeO4x72bs3AUvmTEqtOywxqrxagbi+uMUHWuQSQ=;
        b=u5DNCdjPNCFyYjHZ36RyAkocAJAtn6YB3V+QrMjPuMDzW9MUUPODg7bV7B1u23aKvq
         viVZ7BgH7qaTxO00y7giqQ4q1wFH8GQV2gwEOQkDijP7OfS63GkVF2AvK2qofHzSdUZv
         xxhuLf4MWTbBhUHNojKo0ZP3cyxEIPwY97zbpBVOuPVSwmnMOp3Vy/jXsum7yvzVlioa
         YqyfqWtn51sd5HJxPW3jZFx0Uff6L+gejBVF4kNYL5TiG7fnt8G24Fye9wA2QJtaNy23
         8XIIzRX4b323nxEHKJXdb7XCQ8X9vHFphPyovpoltx3PCCjGS0F7k7MzIhn2IewctzVh
         oXsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoXXl0ALZ5W/tK1Woa54s5BIv0ku6L5NVCyEyKf+zTNAgeUdZGEntviDj4V/dxZmQ7zSlBXHXCnqIWELOomtbdlkhhS2iQ2tHk
X-Gm-Message-State: AOJu0Yw0rbxYQ/nQrp37sS9L+2Z1d+UZHtuF0p1F24D8gSEOQd5qYKVD
	xStrwPqliYHC9Fa3sGJkZCp5xB6dt7wHin+JPzsqOGjfteU++EIW8eRn4ifNlk0=
X-Google-Smtp-Source: AGHT+IHG9kPQkhg3JSWWrcuHi1+sLlRaO9d5IHwbE6um4kWNgdiD0lDhIkh1bAKYCo23+kRRc/aVwg==
X-Received: by 2002:aa7:d591:0:b0:565:af2e:d016 with SMTP id r17-20020aa7d591000000b00565af2ed016mr295203edq.32.1708765960266;
        Sat, 24 Feb 2024 01:12:40 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s8-20020a056402164800b005652f6a9533sm363120edx.74.2024.02.24.01.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 01:12:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: clock: keystone: remove unstable remark
Date: Sat, 24 Feb 2024 10:12:34 +0100
Message-Id: <20240224091236.10146-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keystone clock controller bindings were marked as work-in-progress /
unstable in 2013 in commit b9e0d40c0d83 ("clk: keystone: add Keystone
PLL clock driver") and commit 7affe5685c96 ("clk: keystone: Add gate
control clock driver") Almost eleven years is enough, so drop the
"unstable" remark and expect usual ABI rules.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/keystone-gate.txt | 2 --
 Documentation/devicetree/bindings/clock/keystone-pll.txt  | 2 --
 2 files changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/keystone-gate.txt b/Documentation/devicetree/bindings/clock/keystone-gate.txt
index c5aa187026e3..43f6fb6c9392 100644
--- a/Documentation/devicetree/bindings/clock/keystone-gate.txt
+++ b/Documentation/devicetree/bindings/clock/keystone-gate.txt
@@ -1,5 +1,3 @@
-Status: Unstable - ABI compatibility may be broken in the future
-
 Binding for Keystone gate control driver which uses PSC controller IP.
 
 This binding uses the common clock binding[1].
diff --git a/Documentation/devicetree/bindings/clock/keystone-pll.txt b/Documentation/devicetree/bindings/clock/keystone-pll.txt
index 9a3fbc665606..69b0eb7c03c9 100644
--- a/Documentation/devicetree/bindings/clock/keystone-pll.txt
+++ b/Documentation/devicetree/bindings/clock/keystone-pll.txt
@@ -1,5 +1,3 @@
-Status: Unstable - ABI compatibility may be broken in the future
-
 Binding for keystone PLLs. The main PLL IP typically has a multiplier,
 a divider and a post divider. The additional PLL IPs like ARMPLL, DDRPLL
 and PAPLL are controlled by the memory mapped register where as the Main
-- 
2.34.1


