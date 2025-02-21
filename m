Return-Path: <linux-clk+bounces-18473-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C165A3F746
	for <lists+linux-clk@lfdr.de>; Fri, 21 Feb 2025 15:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22022863257
	for <lists+linux-clk@lfdr.de>; Fri, 21 Feb 2025 14:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AA5210F69;
	Fri, 21 Feb 2025 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="a2zt5gX9"
X-Original-To: linux-clk@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F821018A;
	Fri, 21 Feb 2025 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148213; cv=pass; b=dSvnq2pcrN5mR2mGyBcsVH93bwtra6zAXqzgnGa2DVnqwMRnaUHlfW3fJmDu6tBUABn6XuVNTAi0R4MN/4L7h0DjWS0JUGKOgQVpWJAB4fgrCWPb2ea4WxFjDTIIozZi4imeXrwerM727MtnQhvvzIiaa6KdFVqRXtjxengmgNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148213; c=relaxed/simple;
	bh=Chjhf8vJRRIgpjHc/tp8kE54BRHZN3NALF21aMcfaHA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=c4p0Y4ed9S1j8FH9vfYFwT6hKtU9hkuFJHNLIXOZouR6/vJLhuv28ZW/S1XtohWdYzAV1gbzvCuufcI7MgSBXTmB93aWyPkCChGgWPTrhUO1wDkSJXjD1jNoqbRJNHq+0j55VetiqHh0AM/de/WX9hRaYErGFcG/FQgxK7h1KYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=a2zt5gX9; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740148181; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jH+Xy4+9AYhc8lqk6kHd5V7bLdJU+U8s+TJrmbRb9qfw7yURYlVcdNcoHkfV9lwFbbnB06p26NUv9sPfsn9KEv2QmFAU/3j0BbtXjQ0WXNBeE3OaLgoJdyR3fLlABIiiVEyBvty2vb5jcwIcVBgoiHW89JenhtDQ41nnBKqfkxQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740148181; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FyMjlHOrINYVn23syNq5kTMbUgMoK8l1mTchNcYyMuQ=; 
	b=RxEgDRY3aL/zQKLx7X0Vg57MMpsEDKSUQXgNTN6+MctF1I3r3M3Ym6RTbQm+rOcvNFN1DFd6Dugl2idyebsJBbINmGlBT62s+6QV66n6cMfX8U7nrmWfmbMHR8Nmj+V5Rd/hHwv/Sk5I9uIc6Vro2llNyoceVgOpxRPBEZ+oF80=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740148181;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=FyMjlHOrINYVn23syNq5kTMbUgMoK8l1mTchNcYyMuQ=;
	b=a2zt5gX90/33JfzmrEp1ofuABKSB8jnf397rM9Gi8np5LtI260wmC6uBKlYgSqsA
	oiQwuvq7ikLeCyw6y1K+jonR8rxpUVIarB1Ci5B9gLbAASvzafrwqFKmerecRenpKR5
	6RAvYqQX7nmGAnz3XQW41i13rMogCmj8KFna/d48=
Received: by mx.zohomail.com with SMTPS id 1740148180118383.75730877084106;
	Fri, 21 Feb 2025 06:29:40 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH V2 2/2] rust: Add basic bindings for clk APIs
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <Z7iGHiQcqa-_AXli@pollux>
Date: Fri, 21 Feb 2025 11:29:21 -0300
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Russell King <linux@armlinux.org.uk>,
 linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4AD8A8F3-EA7E-4FBE-9F0D-58CF7BB09ED5@collabora.com>
References: <cover.1740118863.git.viresh.kumar@linaro.org>
 <a0a1ba4e27c3a0d9e38c677611eb88027e463287.1740118863.git.viresh.kumar@linaro.org>
 <Z7iGHiQcqa-_AXli@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External



> On 21 Feb 2025, at 10:56, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Fri, Feb 21, 2025 at 12:03:39PM +0530, Viresh Kumar wrote:
>> +/// A simple implementation of `struct clk` from the C code.
>> +#[repr(transparent)]
>> +pub struct Clk(*mut bindings::clk);
>=20
> I remember that Stephen explained that NULL is valid value for struct =
clk. As a
> consequence, all functions implemented for `Clk` have to consider =
this.

I am a bit confused here. If NULL is valid, then why should we have to =
specifically
consider that in the functions? No functions so far explicitly =
dereferences that value,
they only pass it to the clk framework.

Or are you referring to the safety comments only? In which case I do =
agree (sorry for
the oversight by the way)

>=20
> I wonder if it could make sense to have a transparent wrapper type
> `MaybeNull<T>` (analogous to `NonNull<T>`) to make this fact more =
obvious for
> cases like this?

MaybeNull<T> sounds nice.

>=20
>> +
>> +impl Clk {
>> +    /// Creates `Clk` instance for a device and a connection id.
>> +    pub fn new(dev: &Device, name: Option<&CStr>) -> Result<Self> {
>> +        let con_id =3D if let Some(name) =3D name {
>> +            name.as_ptr() as *const _
>> +        } else {
>> +            ptr::null()
>> +        };
>> +
>> +        // SAFETY: It is safe to call `clk_get()`, on a device =
pointer earlier received from the C
>> +        // code.
>> +        Ok(Self(from_err_ptr(unsafe {
>> +            bindings::clk_get(dev.as_raw(), con_id)
>> +        })?))
>> +    }
>> +
>> +    /// Obtain the raw `struct clk *`.
>> +    pub fn as_raw(&self) -> *mut bindings::clk {
>> +        self.0
>> +    }
>> +
>> +    /// Clock enable.
>> +    pub fn enable(&self) -> Result<()> {
>> +        // SAFETY: By the type invariants, we know that `self` owns =
a reference, so it is safe to
>> +        // use it now.
>=20
> This is not true.
>=20
> 1. There is no type invariant documented for `Clk`.
> 2. The pointer contained in an instance of `Clk` may be NULL, hence =
`self` does
>   not necessarily own a reference.

>=20
> The same applies for all other functions in this implementation.
>=20


