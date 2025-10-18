Return-Path: <linux-clk+bounces-29313-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B13DBED613
	for <lists+linux-clk@lfdr.de>; Sat, 18 Oct 2025 19:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ADA944ED8E2
	for <lists+linux-clk@lfdr.de>; Sat, 18 Oct 2025 17:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F279B263F34;
	Sat, 18 Oct 2025 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJG3/6Gt"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF0023EA9C
	for <linux-clk@vger.kernel.org>; Sat, 18 Oct 2025 17:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809538; cv=none; b=EApXxbrc8O/foTAWikkqn3kicTcwRdonNrfgWSi0bCbGoMCU609LdEwfTjNMXmuDdFyvAYn6wzP7FPRW1sxyWmfItR2/LIl9Eb7nxVqWma5Fpos76jjmNsGFIBd9uqAEbuGh33sMSd2OoSY1ssNwAswB28FJj6zdjct6JyN7IEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809538; c=relaxed/simple;
	bh=5IzviSKzcg5QXxBA9uZe2s664KTsV8Tne2rtRwo/bww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3+nQ9GNww008qgT1nF1AxU9KlWIl40aIwccvee3kQVmt4QtGwMzWsZ2pyI2qdOawlHjq9mUlJ6svF1sBNeShrhmxRy1uLKCflmksUAer5PpyRGy5okOgO8aVcW8/JMFdFwqc+5BzKBarPDUnqOgLeyez7CDKaefBeJp7AP69c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJG3/6Gt; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-87be45cba29so43507936d6.2
        for <linux-clk@vger.kernel.org>; Sat, 18 Oct 2025 10:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809535; x=1761414335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmofoJkHkMxsaLhdlprPrmfRRb4k8Y1fAGmfllLm4kw=;
        b=ZJG3/6Gteo9olAXqVARMktT7970S10Og5iqqXGvviBZaYI7d7JPC9qGIL2oEfjiZG5
         mYlHT4avdv4V1Wpd6+UyqpW9iNhyWcQW2ca6sM2xFVQwmyqMqiMp+KtKmJYdLpwe96cf
         ODKBILU4iiDrPrFQ9/uKAErgx/tY8aeHvvgiKSbk5e+WvoFfQNzjL71doWLDizZCYskw
         8fuJVwd2DmII2uIBi5sP3NvtaCviOjkut1rDkDCXY9z9hvEYLWKUCh8mtjUWb9pEB2lX
         gWAtNLdD2w5ahL5OY52OAj+D2WDOPQUfkkpStayU+9nNEaQdqGoFCUkuEDESUJZu42wh
         5ubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809535; x=1761414335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmofoJkHkMxsaLhdlprPrmfRRb4k8Y1fAGmfllLm4kw=;
        b=SU3JgBoUGxnZEzPAMkUP3sO+TZZBdU9e18VWxZWwfIFOLGZGDG2BNQQuO+T9IKiAiB
         aYCfuRm7IpOUb66vgPRuL2zcuWkeCp1HjxpFiihSLAnLGVBYLe7rdQ955awzbWzz986P
         DHp4zWBy4zWXuSH0ixHDfO2Pj8z3irXkEh8f/QxaC4/OElkMc7XHesnHeTp479eOa2q6
         BnM+eztPfbLHK8QCydJQliBhR35k7nsGaq3HipcDcXMV5SqooJUJHZptjnd1SBDfC8kb
         YdOSF1vx5COyyE6czpZM4s/8xS/ExEu9dUP86iwmLKF6alKGmXGUEGpC+K3YApEGDXer
         hUBg==
X-Forwarded-Encrypted: i=1; AJvYcCXpvdIPH0TWEeBOUmKYaPqf1X0Yrgovuqs8XsiWv/JXn2SsTqMmVxfNPa+srtkdnsgVq92gssjoFGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSmlV35Q0iAJnlsv8rZBsxPw1/ZkivE3u97nC/hBKHKzH32PBI
	QO8s/zKPsBYUqzuVSh8zhm6FDuVu/vQQPAYfimcGZW67y4JZBpnZTG4a
X-Gm-Gg: ASbGncsf2z7/5Y7GDNy78JxKgnLEPnNegLstJrSD0PdjmEha+/BfGUlQinTCAYrpaua
	AGd2sAoibe2UO1F2Z5kjxHuNMBp7v7dKCkLmbeVEX7xu63N5215IIbH6jEvJfOE+qKdn8FEHvjc
	ulS0wKtpTRSWrv1ieNUzLrLMCJoShhTfMTz6biwwFz5Xq9PIMPeVGs9DTFowgG0AuXxUPWpOKq7
	uYdBGV/F0JzI1/pAzD+8/Popu/4bAylv1hvTB3z+Y1PVgaasJ8Z+Jmq8Ak1EQkK05AUgLh1kYUF
	iBKzkJ0Jvook2z79ZjnV3Owx7fh4zNNthXT62pmxdz2OO5Nf6ZnbsF/iDwAW3KeB+rCxL0ztaBr
	/d599QasSiVEjw4Gumla9Y+7L6G4YhiDh0gW9kO51D8RRcbTAKVEFMzvUQbFEh2MexMYvxwqJpn
	7f8v37QIGTsjoafhE3p7otPn3OTdMCrczUXOaR0k3rXUZfvRlUno8ZHMNfx+fu9N0bcurVG/mJG
	ve3p68hrQw+pWDSFZSYFQ7o/2QfeD2KERsX0oSZXqKtZj8oVN3C
X-Google-Smtp-Source: AGHT+IHGPyNylAC+NcjKR3LVCwruQ+XagK91t9ZK/AgOi9yexcJC3Bdqjt9T2UkkZHJl14b1ky8RWg==
X-Received: by 2002:a05:622a:10:b0:4e8:a664:2cfa with SMTP id d75a77b69052e-4e8a66467efmr59406621cf.34.1760809535454;
        Sat, 18 Oct 2025 10:45:35 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:45:34 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:12 -0400
Subject: [PATCH v18 01/16] samples: rust: platform: remove trailing commas
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-1-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809526; l=1642;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=5IzviSKzcg5QXxBA9uZe2s664KTsV8Tne2rtRwo/bww=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDwRhntvVCGUiRlEkiv1zZeGhdA6rD6SNhGZH3QI1C43PlBagNvzfDvivxfFTU380ObMT25PMu4
 pe9SrdQ8j/g4=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This prepares for a later commit in which we introduce a custom
formatting macro; that macro doesn't handle trailing commas so just
remove them.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_platform.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 6473baf4f120..8a82e251820f 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -146,7 +146,7 @@ fn properties_parse(dev: &device::Device) -> Result {
 
         let name = c_str!("test,u32-optional-prop");
         let prop = fwnode.property_read::<u32>(name).or(0x12);
-        dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n",);
+        dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n");
 
         // A missing required property will print an error. Discard the error to
         // prevent properties_parse from failing in that case.
@@ -161,7 +161,7 @@ fn properties_parse(dev: &device::Device) -> Result {
         let prop: [i16; 4] = fwnode.property_read(name).required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}'\n");
         let len = fwnode.property_count_elem::<u16>(name)?;
-        dev_info!(dev, "'{name}' length is {len}\n",);
+        dev_info!(dev, "'{name}' length is {len}\n");
 
         let name = c_str!("test,i16-array");
         let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;

-- 
2.51.1


