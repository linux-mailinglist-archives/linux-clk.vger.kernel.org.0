Return-Path: <linux-clk+bounces-9207-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E629290D2
	for <lists+linux-clk@lfdr.de>; Sat,  6 Jul 2024 06:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D277E1F21E3C
	for <lists+linux-clk@lfdr.de>; Sat,  6 Jul 2024 04:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF2E1CA93;
	Sat,  6 Jul 2024 04:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GY99Q+GC"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9B01C6A7;
	Sat,  6 Jul 2024 04:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720241700; cv=none; b=XOPlVy+PoWOilqpgaBYTOpm2tRa+7h6jO1Pv23CiLSm+iuYfyLgxn8qlYZ6D4vmN/ycqrRF6wQr7mBV7RwVFVIItOH+CDauVEHR1jX8o0zEqUg0XBrqx41SMQTQAjv5sFw0+ZMaW3A9Hb0qnVhSgYfAfKuIsScpLqMizw4Grv/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720241700; c=relaxed/simple;
	bh=wxvLpOW05IZBhoJ42Z143u9/Maq90L38LvE9Gw8PR+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgW7HIjRAEK6d+3xIzl0s8XjBwaMw4m9oUbWo2Fhlfzo2QDWjrdj819GpZa55mfpRLGyCGaWx4ZSft9kxblLBoQ6HhiBg+HkAwVPo31e6xEZykrUm4KjIIc+1zBZhRJv9+Y1qh/8A0PJeRNY4JYcuQy7IqOfdE6sTX14aSw9ds8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GY99Q+GC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FBAC4AF0E;
	Sat,  6 Jul 2024 04:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720241699;
	bh=wxvLpOW05IZBhoJ42Z143u9/Maq90L38LvE9Gw8PR+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GY99Q+GCYzaw3qfa51njrC2vovfJRgrxH+xkNriY3zRWmB2m8gtI0Yt+T1J7sIiu+
	 TJRwp0w+y34vujUSLaWngNEA8IxVNz3wR6c/gqvloYFBgrq0DCcDhMBOf41TDJ4lc/
	 728WHUchDncjX+6j6f+9T6wmgN67QvpwP+Jz2YAw7c5Kws0xffdjmRxfY28KTQGquU
	 QAnz/NuS/pR4ry8XNWHqGUNpRAPfwW9ZPZ8TEwVo188kyqwjsOXb929K27Llexuc86
	 nFa6uBv5YQOlG4jN/dT3DBw4DaNoHdriTWPs5eK78a9VVPcj7VArC7x87e7IjjUOE0
	 7lUG/FxaJBWlA==
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
Subject: [PATCH v6 3/8] dt-bindings: vendor-prefixes: Add "test" vendor for KUnit and friends
Date: Fri,  5 Jul 2024 21:54:48 -0700
Message-ID: <20240706045454.215701-4-sboyd@kernel.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240706045454.215701-1-sboyd@kernel.org>
References: <20240706045454.215701-1-sboyd@kernel.org>
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


