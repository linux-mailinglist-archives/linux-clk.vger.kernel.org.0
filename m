Return-Path: <linux-clk+bounces-9452-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EDA92D9D0
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 22:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E73E6B22421
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 20:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5307C198E88;
	Wed, 10 Jul 2024 20:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPY22oAV"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEBC198E7B;
	Wed, 10 Jul 2024 20:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720642371; cv=none; b=fYGItqvYWzSRlyT080BMFKal5M6mih2TGSPULTsIDsqLPSx+MV6815OZEXvi1CAS+Dob0sjc9F7oSIfTxvVNbL8ROeUXwGBmycvMFPI8NLVJ1m4LxJLCXlJk9VUM8JVCzAOitx2u+wuIL9G3RuUnnxJFdNpC6KTw0eclsM5g2Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720642371; c=relaxed/simple;
	bh=wxvLpOW05IZBhoJ42Z143u9/Maq90L38LvE9Gw8PR+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbmY126UvHOX4Ju0/0e8bKnfT8ETsuR+W33+W5ub0FX4KNew/6aTlm4qMTe5j//+Q73rGEAUjNbfxfA5SjdkFsWZdlYa6gNNbbkTXiwYjQdEYx2SjM49D+1I1oOry+t1FyyE1KjXMepTVh3cvpsULx6LaEtnR1W+Gq59IaQuTuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPY22oAV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8B7C4AF0E;
	Wed, 10 Jul 2024 20:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720642371;
	bh=wxvLpOW05IZBhoJ42Z143u9/Maq90L38LvE9Gw8PR+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WPY22oAVLHyP7dJze2QYznzojVtL3RMAt0lqyZOo0NZi3G0zialjy5JQ+M7sYg9ZE
	 eZdEJ889Q8akljgev0+c6C5f7HS7dFCWosCyHrCbwpa1+kOIuOGHuH4MwnVwmxMp8j
	 GPTozoHtX9kZbUHSrw3ULamaFhHzeR3tx/8QNPrMP/xkVCkiEuTSOvKoREOorCxnfl
	 H02pNp7yMHc82FVfso+KVBJ4JfmXtC2wi/A0o558wcs3Dy3bBrrac7ddr7slSiSQKC
	 QxGUpe8FyOZzDwOFCVg4/sOD7Oo/oe+3iu04BszuzQczLuCJnB2UrwlWur6W95VXTD
	 TZREipYDuQAKw==
From: Stephen Boyd <sboyd@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	patches@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org,
	devicetree@vger.kernel.org,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Daniel Latypov <dlatypov@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 3/8] dt-bindings: vendor-prefixes: Add "test" vendor for KUnit and friends
Date: Wed, 10 Jul 2024 13:12:39 -0700
Message-ID: <20240710201246.1802189-4-sboyd@kernel.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240710201246.1802189-1-sboyd@kernel.org>
References: <20240710201246.1802189-1-sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix "test" to reserve a vendor prefix for bindings
that are purely for testing device tree code. This allows test code to
write bindings that can be checked by the schema validator.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: David Gow <davidgow@google.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fbf47f0bacf1..02a22c2722ec 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1456,6 +1456,8 @@ patternProperties:
     description: Terasic Inc.
   "^tesla,.*":
     description: Tesla, Inc.
+  "^test,.*":
+    description: Reserved for use by tests. For example, KUnit.
   "^tfc,.*":
     description: Three Five Corp
   "^thead,.*":
-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git


